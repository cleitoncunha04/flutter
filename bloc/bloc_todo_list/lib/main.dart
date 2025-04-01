import 'package:bloc_todo_list/add_todo_page.dart';
import 'package:bloc_todo_list/bloc/bloc/todo_bloc.dart';
import 'package:bloc_todo_list/cubit/todo_cubit.dart';
import 'package:bloc_todo_list/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => TodoCubit(),
      ),
      BlocProvider(
        create: (context) => TodoBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoList(),
        '/add-todo': (_) => const AddTodoPage(),
      },
    );
  }
}
