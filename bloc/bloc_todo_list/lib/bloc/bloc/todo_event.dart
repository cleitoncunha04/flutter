part of 'todo_bloc.dart';

sealed class TodoEvent {}

class TodoAdd extends TodoEvent {
  TodoAdd({
    required this.todoModel,
  });

  final TodoModel todoModel;
}

class TodoToggleIsCompleted extends TodoEvent {
  TodoToggleIsCompleted({
    required this.id,
  });

  final int id;
}
