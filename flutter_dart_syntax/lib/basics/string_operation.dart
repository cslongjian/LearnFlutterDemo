import 'package:flutter/material.dart';

class StringOperation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("String"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'test string',
              style: Theme.of(context).textTheme.display1,
            ),
            MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text('press me !!'),
                onPressed: () {
                  // ...
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
