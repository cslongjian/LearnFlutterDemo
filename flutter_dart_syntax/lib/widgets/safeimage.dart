import 'package:flutter/material.dart';

class SafeImageUtil {


  static Image safeImage(Image image) {
    final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((_, __) {},
        onError: (dynamic exception, StackTrace stackTrace) {
      print('enter onError start');
//      print(exception);
      print(stackTrace);
      print('enter onError end');
    }));
    return image;
  }
}
