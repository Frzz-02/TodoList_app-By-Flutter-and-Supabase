import 'package:todolist_app/features/todos/domain/entities/todos.dart';


// disini kita akan bikin template atau kontrak bernama TodoRepository.
// Jadi ini cuma deklarasi aja — belum ada isi.
// Isinya nanti akan kita buat di impl (implementation-nya yang ada pada folder data/repositories/).

abstract interface class TodosRepository {
  Future<List<Todos>> getTodos();
  Future<void> addTodo(Todos todo);
  Future<void> delTodo(String id);
  Future<void> toggleTodoStatus(String id, bool isCheked);
}
