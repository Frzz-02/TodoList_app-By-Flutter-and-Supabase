import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/features/todos/data/repositories/todos_repository_impl.dart';
import 'package:todolist_app/features/todos/domain/entities/todos.dart';
import 'package:todolist_app/features/todos/domain/use_cases/add_todos_use_case.dart';
import 'package:todolist_app/features/todos/domain/use_cases/del_todos_use_case.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_todos.dart';
import 'package:todolist_app/features/todos/domain/use_cases/update_all_data_todos_use_case.dart';
import 'package:todolist_app/features/todos/domain/use_cases/update_todos_use_case.dart';

part 'todo_state.dart';

class TodoBloc extends Cubit<TodoState> {
  final TodosRepositoryImpl repository;
  TodoBloc({required this.repository}) : super(InitialTodoState());

  // late final GetTodos getTodos;
  // late final AddTodosUseCase addTodos;
  // late final DelTodosUseCase delTodos;
  // late final UpdateTodosUseCase updateTodos;


  void getAllTodos() async {
    emit(TodoLoading(information: "fetch"));

    try {
      
      final getTodos = GetTodos(repository : repository);
      final todos = await getTodos();
      emit(TodoLoaded(data: todos));
      
    } catch (e) {

      emit(TodoError(e.toString()));
      
    }
  }

  





  void addTodo(Todos todo) async {
    emit(TodoLoading(information: "addTodo"));

    try {
      final addTodos = AddTodosUseCase(repository: repository);
      await addTodos(todo);
      // print('success');
      getAllTodos();
      // emit(Successful( message : "Data berhasil ditambahkan"));
      
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }





  void delTodo(String id, String title) async {
    // emit(TodoLoading(information: "delete"));

    try {
      final delTodos = DelTodosUseCase(repository: repository);
      await delTodos(id);
      // refreshAllTodos();
      emit(Successful(message: "Data $title berhasil dihapus"));
      await Future.delayed(const Duration(seconds: 3));
      refreshAllTodos();
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }














  void refreshAllTodos() async {
    try {
      final getTodos = GetTodos(repository : repository);
      final todos = await getTodos();
      emit(TodoLoaded(data: todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }


  void updateTodosStatus(String id, bool isChecked) async {
    emit(TodoLoading(information: "update:${id}"));

    try {

      final updateTodos = UpdateTodosUseCase(repository: repository);
      await updateTodos(id, isChecked);
      refreshAllTodos();     
      emit(Successful( message : "Data berhasil diperbarui"));
     
      // await Future.delayed(const Duration(seconds: 3));
      // refreshAllTodos();      
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  
  
  
  void updateTodosData(Todos data) async {
    print('\n\n\nsedang memproses update todos');
    emit(TodoLoading(information: "fetch"));

    try {
      print(data.id + " \n" + data.title + " \n" + data.description + " \n" + data.isChecked.toString() + " \n" + data.createdAt.toString() + " \n" + data.deadline.toString());
      final updateTodos = UpdateAllDataTodosUseCase(repository: repository);
      await updateTodos(data);
      print('sudah update');
      refreshAllTodos();     
      emit(Successful( message : "Data berhasil diperbarui"));
      // await Future.delayed(const Duration(seconds: 3));
      // refreshAllTodos();      
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }






}
