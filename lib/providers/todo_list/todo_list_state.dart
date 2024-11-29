import 'package:first_app_flutter/models/todo_model.dart';

List<Todo> todosUser = [
  Todo(
    desc: "Foto 1",
  ),
  Todo(
    desc: "Foto 2",
  ),
  Todo(
    desc: "Foto 3",
  ),
];

class TodoListState {
  final List<Todo> todos;

  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(
      todos: todosUser,
    );
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
