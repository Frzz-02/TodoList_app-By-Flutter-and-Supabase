import '../repositories/todos_repository.dart';

class DelTodosUseCase {
  final TodosRepository repository;

  DelTodosUseCase({required this.repository});

  Future<void> call(String id) async {
    await repository.delTodo(id);
  }
}
