import 'package:first_app_flutter/providers/todo_list/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateTodoWidget extends StatefulWidget {
  const CreateTodoWidget({super.key});

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  late TextEditingController createTodoController;

  @override
  void initState() {
    createTodoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    createTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: createTodoController,
      decoration: const InputDecoration(label: Text("Importar foto")),
      onSubmitted: (String? todoDesc) {
        if (todoDesc != null && todoDesc.trim().isNotEmpty) {
          context.read<TodoListProvider>().addTodo(todoDesc.trim());

          createTodoController.clear();
        }
      },
    );
  }
}
