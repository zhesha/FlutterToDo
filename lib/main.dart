import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homePage = new HomePage();
    return new MaterialApp(
      title: 'ToDo list',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(title: new Text('ToDo list'), actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                homePage.clearDoneTasks();
              }),
        ]),
        body: homePage,
      ),
    );
  }
}
