import 'package:todolist_app/features/todos/domain/entities/todos.dart';
import 'package:todolist_app/features/todos/domain/repositories/todos_repository.dart';

class GetTodos {
    // disini kita definisikan field yang merupakan objek class TodosRepository menggunakan tipe data TodosRepository
  final TodosRepository repository;  

    // dan kita buat constructor untuk menginisialisasi field tersebut
  GetTodos({required this.repository});

    // kita buat method call yang akan mengembalikan data List<Todos> dan bersifat async
  Future<List<Todos>> call() async {
    return await repository.getTodos();
  }
  
    // method call ini sebenarnya adalah method khusus bawaan dari dart
    
    // sebenarnya method ini bisa terpanggil degan cara mendeklarasikan variabel yang berisi intance dari class ini,
    // kemudian kita panggil nama variabelnya selayaknya sebuah function, misalnya:
    // final getTodos = GetTodos(repository);
    // final todos = await getTodos(); //ini otomatis memanggil method call()

    // disitu kita menggunakan await saat memanggil method getTodos, karena kita mendeklarasikan fungsi call() dengan future
    // note: setiap fungsi yang didefinisikan dengan future harus menggunakan await saat memanggilnya





    // Question: kenapa kita harus menggunakan keyword await 2 kali ? ( pada saat pemanggilan dan saat mendefinisikan fungsi call() yang dipakai di return )
    //untuk penggunaan await di dalam fungsi call ini(return await repository.getTodos();) adalah untuk memastikan bahwa fungsi call() ini menunggu hasil dari operasi asinkron (fetch data dari database/API) sebelum mengembalikan nilainya.
    //akan tetapi, nilai yang dikembalikan oleh fungsi call() ini masih/tetap berupa future<List<todos>>, 
    //agar fungsi call ini bisa mengembalikan nilai dengan type List<todos>, maka pada saat pemanggilannya kita harus menggunakan keyword await. (perhatikan catatan diatas)

              //  Analogi Sederhana
              // Bayangkan Anda memesan makanan di restoran:
              // 1. Di dalam dapur (fungsi call()):
              //    - Koki menunggu makanan selesai dimasak sebelum mengirimkannya ke pelayan.
              //    - Ini seperti await di dalam fungsi call().
              // 2. Di meja pelanggan (pemanggilan getTodos()):
              //    - Pelayan membawa makanan ke meja Anda, tetapi Anda tetap harus menunggu makanan sampai di meja.
              //    - Ini seperti await di luar fungsi call().
}