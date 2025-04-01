class TodoModel {
  TodoModel({
    required this.id,
    required this.task,
    this.isCompleted = false,
  });

  final int id;
  final String task;
  final bool isCompleted;

  TodoModel copyWith({
    int? id,
    String? task,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
