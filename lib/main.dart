import 'package:first_app_flutter/providers/todo_list/todo_list_provider.dart';
import 'package:first_app_flutter/ui/pages/todos_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoListProvider>(
          create: (context) => TodoListProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: TodosPage(),
      ),
    );
  }
}
