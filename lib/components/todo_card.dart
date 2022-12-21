import 'package:flutter/material.dart';
import 'package:knowunity_study/controllers/todo_controller.dart';
import 'package:knowunity_study/models/todo.dart';
import 'package:knowunity_study/resources/constants.dart';
import 'package:provider/provider.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.todo.title;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 15, top: 10, bottom: 10),
        decoration: boxDecoration,
        child: Row(
          children: [
            SizedBox(
              //                                     body|container|icon|extra
              width: MediaQuery.of(context).size.width - 20 - 35 - 30 - 20,
              child: TextField(
                maxLength: null,
                style: style20,
                controller: titleController
                  ..selection = TextSelection.collapsed(offset: titleController.text.length),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: () {
                final controller = Provider.of<TodoController>(
                  context,
                  listen: false,
                );
                controller.updateTodo(
                    widget.todo, Todo(title: widget.todo.title, isCompleted: !widget.todo.isCompleted));
              },
              icon: Icon(
                widget.todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
