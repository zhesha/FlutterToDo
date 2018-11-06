import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var todoList = List<String>();
  TextField _textField;

  TextField _getTextField() {
    if (_textField == null) {
      TextEditingController textEditingController = new TextEditingController();
      _textField = new TextField(
        controller: textEditingController,
        onSubmitted: (taskName) {
          setState(() {
            todoList.add(textEditingController.text);
            textEditingController.clear();
          });
        },
      );
    }

    return _textField;
  }

  List<Widget> _todoListView() {
    var result = List<Widget>();
    for (var index = 0; index < todoList.length * 2 - 1; index += 1) {
      if (index.isOdd) {
        result.add(new Divider());
      } else {
        result.add(new Text(todoList.elementAt(index ~/ 2)));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _getTextField(),
        new Expanded(
            child: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: _todoListView(),
        ))
      ],
    );
  }
}
