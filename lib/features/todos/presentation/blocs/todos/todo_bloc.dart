import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/features/todos/data/repositories/todos_repository_impl.dart';
import 'package:todolist_app/features/todos/domain/entities/todos.dart';
import 'package:todolist_app/features/todos/domain/use_cases/add_todos_use_case.dart';
import 'package:todolist_app/features/todos/domain/use_cases/del_todos_use_case.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_todos.dart';
import 'package:todolist_app/features/todos/domain/use_cases/update_todos_use_case.dart';

part 'todo_state.dart';

class TodoBloc extends Cubit<TodoState> {
  final TodosRepositoryImpl repository;
  TodoBloc({required this.repository}) : super(InitialTodoState());

  late final GetTodos getTodos;
  late final AddTodosUseCase addTodos;
  late final DelTodosUseCase delTodos;
  late final UpdateTodosUseCase updateTodos;


  void getAllTodos() async {
    emit(TodoLoading());

    try {
      getTodos = GetTodos(repository : repository);
      final todos = await getTodos();
      emit(TodoLoaded(data: todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }





  void addTodo(Todos todo) async {
    emit(TodoLoading());

    try {
      addTodos = AddTodosUseCase(repository: repository);
      await addTodos(todo);
      emit(Successful( message : "Data berhasil ditambahkan"));
      
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }





  void delTodo(String id, String title) async {
    emit(TodoLoading());

    try {
      delTodos = DelTodosUseCase(repository: repository);
      await delTodos(id);
      emit(Successful(message: "Data $title berhasil dihapus"));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }






  void updateTodo(String id, bool isChecked) async {
    emit(TodoLoading());

    try {
      updateTodos = UpdateTodosUseCase(repository: repository);
      await updateTodos(id, isChecked);
      emit(Successful( message : "Data berhasil diperbarui"));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }


}
