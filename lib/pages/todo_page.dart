import 'package:flutter/material.dart';
import 'package:knowunity_study/components/todo_card.dart';
import 'package:knowunity_study/controllers/todo_controller.dart';
import 'package:knowunity_study/models/todo.dart';
import 'package:knowunity_study/resources/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    final controller = Provider.of<TodoController>(
      context,
      listen: false,
    );
    controller.fetchTodos();
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<TodoController>(builder: (_, provider, __) {
      if (!provider.isDone) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [CircularProgressIndicator(), Text('Fetching...')],
            ),
          ),
        );
      }
      final List<Todo> todos = provider.listTodos;
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todo app'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              provider.createTodo();
              scrollController.animateTo(scrollController.position.maxScrollExtent + 100,
                  duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
            },
            child: const Icon(Icons.add, size: 30),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Results for User ID - $selectedUserId',
                      style: style20,
                    ),
                    for (Todo todo in todos) TodoCard(todo: todo)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
