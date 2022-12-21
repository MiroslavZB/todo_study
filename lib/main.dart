import 'package:flutter/material.dart';
import 'package:knowunity_study/controllers/todo_controller.dart';
import 'package:knowunity_study/pages/todo_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoController>(
      create: (_) => TodoController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
