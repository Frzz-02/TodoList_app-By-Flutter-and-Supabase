// import 'package:bloc_test/bloc_test.dart';
// import 'package:todolist_app/features/todos/data/repositories/todos_repository_impl.dart';
// import 'package:todolist_app/features/todos/presentation/blocs/todos/todo_bloc.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// void main() async {

//     blocTest<TodoBloc, TodoState>(
//       'test data todo', 
      
//         build: () => TodoBloc(repository: TodosRepositoryImpl(Supabase.instance.client)), // replace with your actual repository
      
//         verify: (bloc) {
//           final init = bloc.state as InitialDateState;
//           print(init);
//           // expect(bloc.state, isA<InitialState>());
//         },

//         act: (bloc) {
//           bloc.getAllTodos();
//           print(bloc.state);
//           // bloc.addTodo(Todos(id: '1', title: 'Test Todo', isCompleted: false));
//           // bloc.delTodo('1', 'Test Todo');
//           // bloc.updateTodo(Todos(id: '1', title: 'Updated Todo', isCompleted: true));
//         },

//     );
// }
