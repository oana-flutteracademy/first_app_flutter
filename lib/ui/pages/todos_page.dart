import 'package:first_app_flutter/providers/todo_list/todo_list_provider.dart';
import 'package:first_app_flutter/ui/widgets/create_todo_widget.dart';
import 'package:first_app_flutter/ui/widgets/show_todos_widget.dart';
import 'package:first_app_flutter/ui/widgets/todo_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoListProvider>().state.todos;

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 70),
          const TodoHeaderWidget(),
          const SizedBox(height: 20),
          ShowTodosWidget(todos: todos),
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CreateTodoWidget(),
          ),
        ],
      ),
    );
  }
}
