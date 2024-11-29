import 'package:first_app_flutter/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final VoidCallback? changeTodoValue;

  final TextEditingController textEditingController;

  const TodoItemWidget({
    super.key,
    required this.todo,
    this.changeTodoValue,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Editar Tarea"),
                content: TextField(
                  controller: textEditingController,
                  autofocus: true,
                  onChanged: (value) {},
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      changeTodoValue!();
                      textEditingController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("ACEPTAR"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("CANCELAR"),
                  ),
                ],
              );
            });
      },
      title: Text(todo.desc),
    );
  }
}
