import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
//  final Padding _paddingTextTop = const Padding(
//    padding: EdgeInsets.only(
//      top: 32.0,
//    ),
//  );
//
  final Padding _paddingImgTop = const Padding(
    padding: EdgeInsets.only(
      top: 22.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
        body: FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 20.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('res/login_bkg.png'), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_buildHead(), _buildBottom()],
          )),
    ));
  }

  Widget _buildHead() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            BackButton(
              color: Colors.white,
            ),
          ],
        ),
        Image.asset('res/logo_white.png'),
        Container(
            height: 47,
            width: 304,
            decoration: new BoxDecoration(
              //背景
              color: Color.fromRGBO(255, 255, 255, 0.13),
              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
              borderRadius: BorderRadius.all(Radius.circular(25.25)),
            ),
            child: Row(
              children: <Widget>[],
            )),
        _paddingImgTop,
        Container(
          height: 50,
          width: 300,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            //背景
            color: Color.fromRGBO(166, 166, 166, 0.89),
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius: BorderRadius.all(Radius.circular(25.25)),
          ),
          child: Text("Next"),
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Column(
      children: <Widget>[
        Text(
          "play",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
