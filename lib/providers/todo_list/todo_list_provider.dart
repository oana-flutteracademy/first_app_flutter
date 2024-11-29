import 'package:first_app_flutter/models/todo_model.dart';
import 'package:first_app_flutter/providers/todo_list/todo_list_state.dart';
import 'package:flutter/material.dart';

class TodoListProvider extends ChangeNotifier {
  TodoListState _state = TodoListState.initial();

  TodoListState get state => _state;

  void editTodo(String id, String todoDesc) {
    final newTodos = _state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          desc: todoDesc,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();
    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void addTodo(String todoDesc) {
    final Todo newTodo = Todo(desc: todoDesc);
    final List<Todo> newTodos = [..._state.todos, newTodo];
    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    final List<Todo> newTodos = List.from(_state.todos)..remove(todo);
    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
}
