import '../../domain/entities/todos.dart';

class TodosModel extends Todos {
  TodosModel({
    // ini adalah constructor dari class TodosModel yang merupakan turunan dari class Todos
    // constructor ini akan memanggil constructor dari class Todos dengan menggunakan super
    // dan mengisi parameter-parameter yang ada di constructor Todos
    // constructor ini juga memiliki parameter yang sama dengan constructor Todos dan sekaligus membuat field-field yang sama yang di class Todos
    required super.id,
    required super.title,
    required super.description,
    required super.isChecked,
    required super.createdAt,
  });




// ini untuk mengonversi data(dari format json/map) dari database ke dalam bentuk objek model (dalam hal ini adalah TodosModel)
  factory TodosModel.fromMap(Map<String, dynamic> map) { //factory ini juga adalah jenis konstructor
    return TodosModel( 
      /*ini artinya kita memanggil kembali constructor TodosModel dan mengisi parameter-parameter yang ada 
        di constructor tersebut untuk memberikan nilai pada setiap field yang ada di class TodosModel*/
      id: map['id'] as String, //baris ini artinya kita memberi tahu dart bahwa map['id'] adalah String (bukan mengkonversi)
      title: map['title'] as String,
      description: map['description'] as String,
      isChecked: map['is_checked'] as bool,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }




// ini untuk mengonversi objek model ke dalam bentuk map untuk dapat disimpan ke dalam database
  Map<String, dynamic> tomap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_checked': isChecked,
    };
  }
}
