import 'package:todolist_app/features/todos/domain/entities/todos.dart';

import '../repositories/todos_repository.dart';

class UpdateAllDataTodosUseCase {
  final TodosRepository repository;

  UpdateAllDataTodosUseCase({required this.repository});

  Future<void> call(Todos data) async {
    print("USE CASE: updateAllDataTodos terpanggil");
    await repository.updateDataTodos(data);
  }
  
  
}
