class Todo {
  final String title;
  final bool isCompleted;

  Todo({required this.title, this.isCompleted = false});

  factory Todo.fromJson(Map json) {
    try {
      return Todo(title: json['title'], isCompleted: json['completed']);
    } catch (e) {
      return Todo.empty();
    }
  }

  factory Todo.empty() {
    return Todo(title: '');
  }
}
