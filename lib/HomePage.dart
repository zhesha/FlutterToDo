import 'package:flutter/material.dart';
import 'package:todo/TodoModel.dart';

enum ShowType { all, onlyNew, done }

class HomePage extends StatefulWidget {
  final state = new HomePageState();

  @override
  State createState() => state;

  void clearDoneTasks() {
    state.clearDoneTasks();
  }

  void showList({ShowType byType}) {
    state.showList(byType: byType);
  }
}

class HomePageState extends State<HomePage> {
  var todoList = List<TodoModel>();
  var showType = ShowType.all;
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
    List<TodoModel> list;

    if (showType == ShowType.onlyNew) {
      list = todoList.where((entry) => !entry.isDone).toList();
    } else if (showType == ShowType.done) {
      list = todoList.where((entry) => entry.isDone).toList();
    } else {
      list = todoList;
    }

    for (var index = 0; index < list.length * 2 - 1; index += 1) {
      if (index.isOdd) {
        result.add(new Divider());
      } else {
        var todo = list.elementAt(index ~/ 2);
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

  void showList({ShowType byType}) {
    setState(() {
      showType = byType;
    });
  }
}
