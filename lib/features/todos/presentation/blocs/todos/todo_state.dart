part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

class InitialTodoState extends TodoState {}

class TodoLoading extends TodoState {}

class Successful extends TodoState {
  final String message;
  Successful({this.message = "Success"});
}

class TodoLoaded extends TodoState {
  final List<Todos> data;
  TodoLoaded({required this.data});
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}
