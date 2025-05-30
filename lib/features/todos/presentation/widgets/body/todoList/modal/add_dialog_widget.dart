import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/features/todos/domain/entities/todos.dart';
import 'package:todolist_app/features/todos/presentation/blocs/todos/todo_bloc.dart';
import 'package:uuid/uuid.dart';

class ConfirmationDialogWidget extends StatefulWidget {
  const ConfirmationDialogWidget({super.key});

  @override
  State<ConfirmationDialogWidget> createState() => _ConfirmationDialogWidgetState();
}

class _ConfirmationDialogWidgetState extends State<ConfirmationDialogWidget> {
    final TextEditingController _deadlineController = TextEditingController();
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController = TextEditingController();
    DateTime? _selectedDate;
    String _timeLocalToUtc = '';


Future<void> _pickDateTime() async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (pickedDate == null) return;

  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime == null) return;

  final combinedDateTime = DateTime(
    pickedDate.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime.hour,
    pickedTime.minute,
    0,
  );

  final utc = combinedDateTime.toUtc();
  _timeLocalToUtc = utc.toIso8601String();
  _deadlineController.text = utc.toLocal().toString().split(':')[0].split(' ')[0] + '  ' + utc.toLocal().toString().split(':')[0].split(' ')[1] + ':' + utc.toLocal().toString().split(':')[1];
  _selectedDate = combinedDateTime;
}
  






  @override
  void dispose() {
    _descriptionController.dispose(); // ✅ penting!
    _titleController.dispose(); // ✅ penting!
    _deadlineController.dispose(); // ✅ penting!
    super.dispose();
  }
  


  
  
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      
      
      
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        height: 565,
        width: 800,
        
        
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, size: 30,),
                  onPressed: (){
                    Navigator.of(context).pop(); // Tutup dialog
                  }, 
                ),
                
              ],
            ),


            SizedBox(height: 10,),
            
            Text(
              'Tambah Tugas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            
            
            
            SizedBox(height: 5),
            Text('Isi setiap data tugas yang ada dan deadline untuk melanjutkan'),
            SizedBox(height: 55),
            








          Align(
            alignment: Alignment.centerLeft,
            child: Text("Masukkan judul tugas : ", textAlign: TextAlign.start, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
          ),
          SizedBox(height: 10,),
          
                      TextFormField(  
                        controller: _titleController,            
                        style: TextStyle(fontSize: 14),
                        decoration:  InputDecoration(
                          hintText: 'Contoh: Belajar flutter',
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          prefixIcon: Icon(Icons.book_outlined),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            )
                          )
                          
                        ),
                      ),
          
          
          
          
          
          
                SizedBox(height: 35,),
          
          
          
          
          


          
          
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Masukkan Deskripsi tugas (opsional) : ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
                      SizedBox(height: 10,),
          
                      TextFormField(
                        controller: _descriptionController,
                        style: TextStyle(fontSize: 14),
                        scrollPadding: EdgeInsets.all(50),
                        decoration:  InputDecoration(
                          hintText: 'Contoh: Belajar Flutter sampai selesai',
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          prefixIcon: Icon(Icons.description_outlined),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            )
                          )
                          
                        ),
                      ),

                      
                      
                SizedBox(height: 25,),
                      
                      
                      
                      
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Text("Masukkan Deskripsi tugas (opsional) : ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                      // SizedBox(height: 7,),
          
                      Container(
                        margin: EdgeInsets.only(left: 500),
                        // width: 200,
                        child: TextFormField(
                          controller: _deadlineController,
                          readOnly: true,
                          onTap: _pickDateTime,
                          style: TextStyle(fontSize: 12),
                          scrollPadding: EdgeInsets.all(50),
                          decoration:  InputDecoration(
                            labelStyle: TextStyle(fontSize: 13),
                            labelText: 'Masukkan deadline tugas',
                            // hintText: 'Contoh: Belajar Flutter sampai selesai',
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                            prefixIcon: Icon(Icons.calendar_today),
                            
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              )
                            )
                            
                          ),
                        ),
                      ),


            
                SizedBox(height: 35,),



                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(  
                    backgroundColor: Color.fromARGB(255, 7, 217, 126),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  
                  onPressed: () {
                      final title = _titleController.text.trim();
                      final desc = _descriptionController.text.trim();
                      final deadlineText = _timeLocalToUtc.trim();

                      // ✅ Validasi sederhana
                      if (title.isEmpty || deadlineText.isEmpty) return;

                      DateTime? parsedDeadline;
                      try {
                        parsedDeadline = DateTime.parse(deadlineText);
                      } catch (e) {
                        parsedDeadline = DateTime.now().add(const Duration(days: 7)); // fallback
                      }

                      final todo = Todos(
                        id: const Uuid().v4(), // <- ganti dengan UUID kalau perlu
                        title: title,
                        description: desc,
                        isChecked: false,
                        createdAt: DateTime.now(),
                        deadline: parsedDeadline,
                      );


                      print(
                        '${todo.id}  Todo created: ${todo.title}, Deadline: ${todo.deadline}, Description: ${todo.description}'
                      );
                      
                      
                    //  context.read<TodoBloc>().addTodo(todo);
                      Navigator.of(context).pop(todo);
                  },



                  child: Text('+  Tambah', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                ),





            
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
                
                
            //     ElevatedButton(
            //       onPressed: () {
            //         // Tindakan jika pengguna menekan "Tidak"
            //         Navigator.of(context).pop();
            //       },
            //       child: Text('Tidak'),
            //     ),
              
              
              
            //   ],),






          ],),
      )
    );
  }
}
