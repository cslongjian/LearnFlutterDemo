import 'package:flutter/material.dart';
import 'package:flutter_first/TipRoute.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('new route'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text('我就是个新页面啊。'),
          RaisedButton(
            onPressed: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return TipRoute(
                  text: '我是初始化参数',
                );
              }));
              print("路由返回值: $result");
            },
            child: Text('gogogo'),
          )
        ],
      )),
    );
  }
}
