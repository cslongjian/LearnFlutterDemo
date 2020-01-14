import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

/*
 * 文件下载
 * 懒加载单例
 */
class BreakPointDownLoadManage {
  //用于记录正在下载的url，避免重复下载
  var downloadingUrls = Map<String, CancelToken>();

  BreakPointDownLoadManage._();

  factory BreakPointDownLoadManage() => _instance ??= BreakPointDownLoadManage._();

  static BreakPointDownLoadManage _instance;


  /*
   *下载
   */
  Future<void> download(url, savePath,
      {ProgressCallback onReceiveProgress,
        Function done,
        Function failed}) async {
    int downloadStart = 0;
    bool fileExists = false;
    File f = File(savePath);
    if (await f.exists()) {
      downloadStart = f.lengthSync();
      fileExists = true;
    }
    print("开始：" + downloadStart.toString());
    if (fileExists && downloadingUrls.containsKey(url)) {
      //正在下载
      return;
    }
    var dio = Dio();
    int contentLength = await _getContentLength(dio, url);
    if (downloadStart == contentLength) {
      //存在本地文件，命中缓存
      done();
      return;
    }
    CancelToken cancelToken = CancelToken();
    downloadingUrls[url] = cancelToken;

    Future<void> downloadByDio(String url, int start) async {
      try {
        Response response = await dio.get(
          url,
          options: Options(
            responseType: ResponseType.stream,
            followRedirects: false,
            headers: {"range": "bytes=$start-"},
          ),
        );
        print(response.headers);
        File file = File(savePath.toString());

        var raf = file.openSync(mode: FileMode.append);
        Completer completer = Completer<Response>();
        Future future = completer.future;

        int received = start;
        int total = response.headers.contentLength;
        Stream<List<int>> stream = response.data.stream;
        StreamSubscription subscription;
        Future asyncWrite;
        subscription = stream.listen(
              (data) {
            subscription.pause();
            // Write file asynchronously
            asyncWrite = raf.writeFrom(data).then((_raf) {
              // Notify progress
              received += data.length;
              if (onReceiveProgress != null) {
                onReceiveProgress(received, total);
              }
              raf = _raf;
              if (cancelToken == null || !cancelToken.isCancelled) {
                subscription.resume();
              }
            });
          },
          onDone: () async {
            try {
              await asyncWrite;
              await raf.close();
              completer.complete(response);
              downloadingUrls.remove(url);
              if (done != null) {
                done();
              }
            } catch (e) {
              downloadingUrls.remove(url);
              completer.completeError(_assureDioError(e));
              if (failed != null) {
                failed(e);
              }
            }
          },
          onError: (e) async {
            try {
              await asyncWrite;
              await raf.close();
              downloadingUrls.remove(url);
              if (failed != null) {
                failed(e);
              }
            } finally {
              completer.completeError(_assureDioError(e));
            }
          },
          cancelOnError: true,
        );
        // ignore: unawaited_futures
        cancelToken?.whenCancel?.then((_) async {
          await subscription.cancel();
          await asyncWrite;
          await raf.close();
        });

        return await _listenCancelForAsyncTask(cancelToken, future);
      } catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        if (e.response != null) {
          print(e.response.data);
          print(e.response.headers);
          print(e.response.request);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print(e.request);
          print(e.message);
        }
        if (CancelToken.isCancel(e)) {
          print("下载取消");
        } else {
          if (failed != null) {
            failed(e);
          }
        }
        downloadingUrls.remove(url);
      }
    }

    await downloadByDio(url, downloadStart);
  }

  /*
   * 获取下载的文件大小
   */
  Future<int> _getContentLength(Dio dio, url) async {
    try {
      Response response = await dio.head(url);
      return response.headers.contentLength;
    } catch (e) {
      print("_getContentLength Failed:" + e.toString());
      return 0;
    }
  }

  void stop(String url) {
    if (downloadingUrls.containsKey(url)) {
      downloadingUrls[url].cancel();
    }
  }

  Future<T> _listenCancelForAsyncTask<T>(
      CancelToken cancelToken, Future<T> future) {
    Completer completer = Completer();
    if (cancelToken != null && cancelToken.cancelError == null) {
      cancelToken.addCompleter(completer);
      return Future.any([completer.future, future]).then<T>((result) {
        cancelToken.removeCompleter(completer);
        return result;
      }).catchError((e) {
        cancelToken.removeCompleter(completer);
        throw e;
      });
    } else {
      return future;
    }
  }

  DioError _assureDioError(err) {
    if (err is DioError) {
      return err;
    } else {
      var _err = DioError(message: err.toString(), error: err);
      if (err is Error) {
        _err.stackTrace = err.stackTrace;
      }
      return _err;
    }
  }
}
