import 'package:bloc_todo_list/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(
          TodoInitial(
            nextId: 0,
            todos: [],
          ),
        ) {
    on<TodoAdd>((event, emit) {
      emit(
        state.copyWith(
          todos: List.from(
            state.todos,
          )..add(
              event.todoModel,
            ),
          nextId: state.nextId + 1,
        ),
      );
    });

    on<TodoToggleIsCompleted>((event, emit) {
      emit(
        state.copyWith(
          todos: state.todos
              .map(
                (todo) => todo.id == event.id
                    ? todo.copyWith(
                        isCompleted: !todo.isCompleted,
                      )
                    : todo,
              )
              .toList(),
        ),
      );
    });
  }
}
