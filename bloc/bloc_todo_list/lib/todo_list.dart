import 'package:bloc_todo_list/bloc/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state.todos.isEmpty) {
          return const SizedBox.shrink();
        }

        return ListView.builder(
          itemBuilder: (ctx, index) {
            return ListTile(
              selectedTileColor: Colors.green,
              onTap: () => context.read<TodoBloc>().add(
                    TodoToggleIsCompleted(
                      id: state.todos[index].id,
                    ),
                  ),
              title: Text(
                state.todos[index].task,
                style: TextStyle(
                  decoration: state.todos[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              leading: state.todos[index].isCompleted
                  ? const Icon(
                      Icons.check,
                    )
                  : const SizedBox.shrink(),
            );
          },
          itemCount: state.nextId,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
