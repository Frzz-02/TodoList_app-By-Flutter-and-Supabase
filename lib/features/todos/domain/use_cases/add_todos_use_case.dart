import 'package:todolist_app/features/todos/domain/entities/todos.dart';

import '../repositories/todos_repository.dart';

class AddTodosUseCase {
  final TodosRepository repository;

  AddTodosUseCase({required this.repository});

  Future<void> call(Todos todo) async {
    await repository.addTodo(todo);
  }
}
