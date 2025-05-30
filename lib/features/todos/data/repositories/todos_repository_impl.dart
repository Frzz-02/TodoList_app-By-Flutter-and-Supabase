import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todolist_app/features/todos/data/models/todos_model.dart';

import 'package:todolist_app/features/todos/domain/entities/todos.dart';
// import 'package:uuid/uuid.dart';
import '../../domain/repositories/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final SupabaseClient client;
  TodosRepositoryImpl(this.client);



  @override
  Future<List<Todos>> getTodos() async {
    final response = await client
        .from('todos')
        .select();



    // sebelumnya, flutter secara default menganggap response sebagai dynamic
    // oleh karena itu, agar kita tetap bisa menggunakan map (yang hanya bisa digunakan oleh objek List) kita perlu memberitahu dart bahwa itu adalah objek list dengan menggunakan "as"
    // return response;
    return (response as List)
            .map((e) => TodosModel.fromMap(e))
              .toList();
    //  selanjutnya kita memanggil TodosModel.fromMap(e) yang mana method ini didefinisikan menggunakan factory sebelumnya (yang mengembalikan konstruktor dari TodosModel)
    //  factory ini hampir sama dgn konstruktor pada umumnya

    // note:
    //   1. perbedaan konstruktor factory dengan konstruktor biasa, diantaranya :
    //      - Konstruktor biasa selalu membuat instance baru dari kelas itu sendiri.
    //      - Konstruktor factory lebih fleksibel:
    // * Bisa menambahkan logika tambahan.
    // * Bisa mengembalikan instance yang sudah ada.
    // * Bisa mengembalikan subclass atau objek lain.
    // Jadi, memanggil method factory tidak sama dengan memanggil konstruktor biasa, meskipun tujuannya sama-sama untuk membuat instance.

    //   2. method map adalah jenis perulangan (sejenis dengan for/foreach) dan hanya dapat digunakan oleh objek list saja (tidak tersedia untuk dynamic, dll)
  }

  @override
  Future<void> addTodo(Todos todo) async {
    // kita menggunakan uuid.v4() untuk membuat id yang unik (perlu didaftarkan ke dependency terlebih dahulu)
    // const uuid = Uuid();
    await client.from('todos').insert(TodosModel(
                id: todo.id,
                title: todo.title,
                description: todo.description,
                isChecked: todo.isChecked,
                createdAt: DateTime.now(),
                deadline: todo.deadline
                )
            .toMap()
        // pada fungsi addTodo, kita disini menggunakan fungsi toMap() yang sebelumnya telah didefinisikan pada class TodosModel
        // hal ini dilakukan untuk mengonversi objek pada TodosModel ke dalam bentuk map agar bisa disimpan ke dalam database di supabase
        // karena pada saat kita fetch data, supabase selalu memberikan datanya dalam bentuk map, dan begitu juga sebeliknya, kita pada saat megirim data, kita juga harus mengubah data yang dalam bentuk objek ke map
        );
  }

  @override
  Future<void> delTodo(String id) async {
    await client.from('todos').delete().eq('id', id);
  }

  @override
  Future<void> toggleTodoStatus(String id, bool isCheked) async {
    await client.from('todos').update({'is_checked': isCheked}).eq('id', id);
  }

  
  @override
  Future<void> updateDataTodos(Todos data) async {
    print("REPOSITORY: updateTodos.data() terpanggil\n\n");
    print(data.id + " \n" + data.title + " \n" + data.description + " \n" + data.isChecked.toString() + " \n" + data.createdAt.toString() + " \n" + data.deadline.toString());
    final response = await client.from('todos')
                .update({
                    'title': data.title,
                    'description': data.description,
                    'deadline': data.deadline.toUtc().toIso8601String(),
                  }).eq('id', data.id).select();

    print('${response}');                  
  }
}