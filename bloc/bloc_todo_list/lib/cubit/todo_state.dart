part of 'todo_cubit.dart';

sealed class TodoState {
  final int nextId;
  final List<TodoModel> todos;

  TodoState({
    required this.nextId,
    required this.todos,
  });

  TodoState copyWith({
    int? nextId,
    List<TodoModel>? todos,
  });
}

class TodoInitial extends TodoState {
  TodoInitial({
    required super.todos,
    required super.nextId,
  });

  @override
  TodoState copyWith({
    int? nextId,
    List<TodoModel>? todos,
  }) {
    return TodoInitial(
      nextId: nextId ?? this.nextId,
      todos: todos ??
          List.from(
            this.todos,
          ),
    );
  }
}
