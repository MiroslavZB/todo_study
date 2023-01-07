import 'package:flutter/material.dart';
import 'package:knowunity_study/models/todo.dart';

import '../services/client.dart';

class TodoController extends ChangeNotifier {
  final List<Todo> _listTodos = [];
  bool isDone = false;

  Future fetchTodos() async {
    isDone = false;
    final parsed = await Client.get();
    if (parsed is! List) {
      return;
    }
    for (var json in parsed) {
      _listTodos.add(Todo.fromJson(json));
    }
    isDone = true;
    notifyListeners();
  }

  get listTodos => _listTodos;

  void createTodo() {
    _listTodos.add(Todo.empty());
    notifyListeners();
  }

  void updateTodo(Todo oldTodo, Todo newTodo) {
    int index = _listTodos.indexWhere((e) => e == oldTodo);
    _listTodos.remove(oldTodo);
    _listTodos.insert(index, newTodo);
    notifyListeners();
  }
}
