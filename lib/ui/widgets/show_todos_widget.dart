import 'package:first_app_flutter/models/todo_model.dart';
import 'package:first_app_flutter/providers/todo_list/todo_list_provider.dart';
import 'package:first_app_flutter/ui/widgets/todo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowTodosWidget extends StatelessWidget {
  final List<Todo> todos;
  const ShowTodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return ListView.builder(
      itemCount: todos.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Dismissible(
              key: ValueKey(todos[index].id),
              background: showBackground(0),
              secondaryBackground: showBackground(1),
              onDismissed: (_) {
                context.read<TodoListProvider>().removeTodo(todos[index]);
              },
              confirmDismiss: (_) {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("¿Estás seguro de querer borrar? "),
                        content: const Text("Esta acción es permanente"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text("Si"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text("NO"),
                          ),
                        ],
                      );
                    });
              },
              child: TodoItemWidget(
                todo: todos[index],
                textEditingController: textEditingController,
                changeTodoValue: () {
                  context.read<TodoListProvider>().editTodo(
                        todos[index].id,
                        textEditingController.text,
                      );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: direction == 0 ? Colors.red : Colors.yellow,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Align(
        alignment:
            direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.delete,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
