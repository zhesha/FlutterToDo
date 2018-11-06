import 'package:flutter/material.dart';
import 'package:todo/TodoModel.dart';

class HomePage extends StatefulWidget {
  var state = new HomePageState();

  @override
  State createState() => state;

  void clearDoneTasks() {
    state.clearDoneTasks();
  }
}

class HomePageState extends State<HomePage> {
  var todoList = List<TodoModel>();
  TextField _textField;

  TextField _getTextField() {
    if (_textField == null) {
      TextEditingController textEditingController = new TextEditingController();
      _textField = new TextField(
        controller: textEditingController,
        onSubmitted: (taskName) {
          setState(() {
            var todo = new TodoModel(name: textEditingController.text);
            todoList.add(todo);
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
        var todo = todoList.elementAt(index ~/ 2);
        result.add(new ListTile(
          title: new Text(todo.name),
          leading: new Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
          onTap: () {
            setState(() {
              todo.isDone = !todo.isDone;
            });
          },
        ));
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

  void clearDoneTasks() {
    setState(() {
      todoList.removeWhere((todo) => todo.isDone);
    });
  }
}
