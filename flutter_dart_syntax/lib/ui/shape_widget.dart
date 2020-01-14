import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("形状样本"),
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_buildButton(context), _buildRadiusView(context)],
        ),
      )
    ]);
  }

  //点击态圆角按钮
  Widget _buildButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Material(
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(22.0)),
              border: Border.all(width: 1, color: Color(0xFF02A16E)),
            ),
            child: InkWell(
                borderRadius: BorderRadius.circular(22.0),
                onTap: () {},
                child: Container(
                  alignment: Alignment(0, 0),
                  height: 40,
                  width: 124,
                  child: Text(
                    "点击态 圆角按钮",
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF02A16E)),
                  ),
                )),
          ),
        ));
  }

  Widget _buildRadiusView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('res/contain_bg.jpg'), fit: BoxFit.fill),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                  color: Color(0x9901855B),
                  offset: Offset(0.0, 2.0),
                  blurRadius: 1.0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(width: 1.0, color: Colors.black)),
        child: Column(
          children: <Widget>[
            Text("测试圆角的Contain"),
            Text("测试阴影效果"),
            Text("测试阴影效果"),
            Text("测试阴影效果"),
            Text("测试阴影效果"),
            Text("测试阴影效果?")
          ],
        ),
      ),
    );
  }
}
