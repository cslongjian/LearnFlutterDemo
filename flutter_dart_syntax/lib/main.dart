import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter_dart_syntax/inputcode/verification_code.dart';
import 'package:flutter_dart_syntax/testdatepicker.dart';

import 'package:flutter_dart_syntax/entity/info_list_item_entity.dart';

import 'package:flutter_dart_syntax/inputcode/opt.dart';
import 'package:flutter_dart_syntax/ui/shape_widget.dart';
import 'package:flutter_dart_syntax/widgets/safeimage.dart';
import 'package:flutter_dart_syntax/widgets/safenetimage.dart';

void main() => runApp(MyApp());

const String LOGTAG = "TTTTTT";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    orderList();

//    testSyntax();
//    defaultValue();

//    TestEmpty();

//    String2int();

//    setState(() {
//      _counter++;
//    });
//
//    DatePickerWidget(
//      minDateTime: DateTime(1900, 1),
//      maxDateTime: DateTime(1900, 1),
//      initialDateTime: DateTime.now(),
//    );

//    listText();

//    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//      return Otp();
//    }));

//    showDialog(context: context, builder: (_) => TestDatePicker());

//    showDialog(context: context,builder: (_)=>  DatePickerWidget(
//      minDateTime: DateTime(1900, 1),
//      maxDateTime: DateTime(2000, 1),
//      initialDateTime: DateTime.now(),
//    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    defaultValue();

//    TestEmpty();

//    String2int();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          color: Colors.orange,
//
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ShapeWidget();
                    }));
                  },
                  child: Text('Ui效果入口'),
                ),

//                Image.network(
//                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576558606627&di=6785adb19bca5e4bac9dd03d0e431ab9&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20160808%2F3967139fcb59404db6302ddfa5d4f66c_th.jpg",
//                ),
                _buildImage(),

                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
//                VerificationCode(
//                  keyboardType: TextInputType.number,
//                  length: 4,
//                  autofocus: true,
//                  onCompleted: (String value) {
//                    //...
//                    print(value);
//                  },
//                ),
              ]))),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildImage() {
//       try {
//      return Image.network(
//        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576558606627&di=6785adb19bca5e4bac9dd03d0e431ab9&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20160808%2F3967139fcb59404db6302ddfa5d4f66c_th.jpg",
//      );
//    } on Exception catch (e) {
//      print('123123123');
//      print(e.toString());
//      print('456456456');
//      return SizedBox.shrink();
//    }

//    Image image = Image.network('test');
//    Image image = Image.network(
//      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576558606627&di=6785adb19bca5e4bac9dd03d0e431ab9&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20160808%2F3967139fcb59404db6302ddfa5d4f66c_th.jpg",
//    );
//    final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
//    stream.addListener(ImageStreamListener((_, __) {},
//        onError: (dynamic exception, StackTrace stackTrace) {
//      print('enter onError start');
//      print(exception);
////      print(stackTrace);
//      print('enter onError end');
//    }));
//    return image;

    Image image = Image.network("https://www.baidu.com/img/bd_logong");

    return SafeNetImage.getImage(image);
  }

  void listText() {
    List listNull;

    List listEmpty = [];

    List listNotEmpty = [1];

    if (listNull == null) {
      print('listNull  is  null');
    }

    if (listEmpty?.isEmpty == true) {
      print('listEmpty  [1] is  true');
    } else {
      print('listEmpty  [2] is  false');
    }

    if (listEmpty?.isNotEmpty == true) {
      print('listEmpty  [3] is  true');
    } else {
      print('listEmpty  [4] is  false');
    }

    if (listNotEmpty?.isEmpty == true) {
      print('listNotEmpty  [??] is  false');
    }

    if (listNotEmpty?.isNotEmpty == true) {
      print('listNotEmpty isNotEmpty [??] is  true');
    }
  }

  void defaultValue() {
    bool whateIsBoolDefaultValue;

    print(whateIsBoolDefaultValue);
    print(LOGTAG + whateIsBoolDefaultValue.toString());

    var list = <String>[];

    var listo = list ?? ["你", "大", "爷"];

    print(listo);
  }

  void String2int() {
    String numStr = '';
//
//    numStr ??= '0';
//    int num = numStr ?? int.parse(numStr);
//    int num;
//
//    if (numStr?.isEmpty == true) {
//      print("numStr = null return num :" + 0.toString());
//
//      print("空字符。转int：" + int.parse(numStr)?.toString());
//    } else {
//      print("change :" + num?.toString());
//    }
//
//    print("change :" + num?.toString());
  }

  void TestEmpty() {
    var list = <String>['1'];

    List<String> listno;

    print("list :" + list.toString());

//    print("listno:" + listno?.toString());

//    if (listno.isEmpty == true) {
//      print(" 未初始化 判断 isNotEmpty 对了");
//    }else
//      {
//        print(" 未初始化 判断 isEmpty 对了");
//      }

    if (list?.isNotEmpty == true) {
      print(" 空列表 判断 isNotEmpty 对了");
    } else {
      print(" 空列表 判断 isNotEmpty  gg");
    }

    List<String> filterList; //=  <String>[];

    if (filterList?.isNotEmpty == true) {
      print("1filterList? 空列表 判断 isNotEmpty  dui ");
    } else if (filterList?.isEmpty == true) {
      print("2filterList? 空列表 判断 isEmpty  [][][]");
    } else {
      print("3filterList? null 判断 isNotEmpty  gg");
    }

//    未初始化 列表【】 都是走false  filterList?.isNotEmpty
  }

  void testSyntax() {
    var list = List();
    list.add("1");
    list.add("2");
    list.add("3");
    list.add("b");
    list.add("c");
    list.add("d");
    list.add("e");
    list.add("f");
    list.add("c");
    list.add("d");
    list.add("e");
    list.add("f");
    list.add("c");
    list.add("d");
    list.add("e");
    list.add("kk");

    var list2 = List();
    list2.add("daa");
    list2.add("sa");
    list2.add("bb");

    var subList = list.sublist(0, 3);

    list.removeRange(0, 3);

    var lisss = list.where((item) {
      if (item == "kk") {
        return false;
      } else {
        return true;
      }
    }).toList();

    list2.addAll(list);
    print("syntax_fu  list       TTTTT：" + list.toString());
    print("syntax_fu  lisss       TTTTT：" + lisss.toString());
    print("syntax_fu： subList    TTTTT  " + subList.toString());
    print("syntax_fu  list2       TTTTT：" + list2.toString());
//    I/flutter (26662): syntax_fu：[a, b, c]

    var emptylist1 = List();
    List emptylist2;

    emptylist2 ??= subList;

    print("syntax_fu  emptylist2      TTTTT：" + emptylist2.toString());

//    print("syntax_fu  emptylist1       TTTTT：" + emptylist1.toString());
//    print("syntax_fu  emptylist2    TTTTT：" + emptylist2?.isEmpty.toString());
//
//    emptylist2 ??= List();
//    print("syntax_fu  emptylist2   2  TTTTT：" + emptylist2?.isEmpty.toString());

//    List emptylist3;
//    print(
//        "syntax_fu  emptylist3   2    TTTTT：" + emptylist3.isEmpty.toString());
  }

  void orderList() {
    List<InfoListItemEntity> list = [];
    for (var i = 1; i < 3; i++) {
      InfoListItemEntity entity = InfoListItemEntity(0, i);

      list.add(entity);
    }

    InfoListItemEntity entity2 = InfoListItemEntity(0, 0);
    InfoListItemEntity entity22 = InfoListItemEntity(0, 0);
    InfoListItemEntity entity23 = InfoListItemEntity(0, 0);
    InfoListItemEntity entity24 = InfoListItemEntity(0, 0);
    InfoListItemEntity entity3 = InfoListItemEntity(1, 5);
    InfoListItemEntity entity4 = InfoListItemEntity(1, 8);
    InfoListItemEntity entity5 = InfoListItemEntity(1, 2);

    list.add(entity2);
    list.add(entity22);
    list.add(entity23);
    list.add(entity24);

    list.add(entity3);
    list.add(entity4);
    list.add(entity5);

    var orderList = _orderData(list);

    print(orderList.toString());

    orderList.forEach((item) {
      print("rank" + item.rank.toString());
      print("pinTime" + item.pinTime.toString());
      print("---------------");
    });
  }

  //排序
  List<InfoListItemEntity> _orderData(List<InfoListItemEntity> list) {
    if (list?.isNotEmpty == true) {
      if (list.length >= 2) {
        //降序rank
        list.sort((left, right) => right.rank.compareTo(left.rank));

        //查找相同项
        Map<int, int> map = {};
        for (var entity in list) {
          int i = 1;
          if (map.containsKey(entity.rank)) {
            i = map[entity.rank] + 1;
          }
          map[entity.rank] = i;
        }

        //遍历有几组Map相同项。找到rank
        var rankList = [];
        map.forEach((key, value) {
          if (value >= 2) {
            rankList.add(key);
          }
        });

        //处理下标。重排，重新插入list
        if (rankList?.isNotEmpty == true) {
          for (var reOrder in rankList) {
            int start = list.indexWhere((entity) => entity.rank == reOrder);
            int end = list.lastIndexWhere((entity) => entity.rank == reOrder);

            List<InfoListItemEntity> reOrderList =
                list.where((entity) => entity.rank == reOrder).toList();
            reOrderList
                .sort((left, right) => left.pinTime.compareTo(right.pinTime));

            list.replaceRange(start, end + 1, reOrderList);
          }
        }
      }

      return list;
    }

    return null;
  }
}
