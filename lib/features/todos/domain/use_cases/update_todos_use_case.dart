import '../repositories/todos_repository.dart';

class UpdateTodosUseCase {
  final TodosRepository repository;

  UpdateTodosUseCase({required this.repository});

  Future<void> call(String id, bool isChecked) async {
    await repository.toggleTodoStatus(id, isChecked);
  }
}
