import 'package:bloc_todo_list/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial(nextId: 0, todos: []));

  void addItem(TodoModel todo) {
    List<TodoModel> todos = state.todos;

    todos.add(todo);

    state.todos.add(todo);

    emit(
      state.copyWith(
        todos: todos,
        nextId: state.nextId + 1,
      ),
    );
  }

  void updateItem(int id) {
    emit(
      state.copyWith(
        todos: state.todos
            .map(
              (t) => t.id == id
                  ? t.copyWith(
                      isCompleted: !t.isCompleted,
                    )
                  : t,
            )
            .toList(),
      ),
    );
  }
}
