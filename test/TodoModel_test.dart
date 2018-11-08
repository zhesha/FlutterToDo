import 'package:flutter_test/flutter_test.dart';
import 'package:todo/TodoModel.dart';

void main() {
  test('TodoModel constraction', () {
    const name = 'test';
    var todo = new TodoModel(name: name);

    expect(todo.name, name);
    expect(todo.isDone, false);
  });
}
