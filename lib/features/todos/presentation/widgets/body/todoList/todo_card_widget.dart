// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todolist_app/features/todos/domain/entities/todos.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_keterangan_waktu_use_case.dart';
import 'package:todolist_app/features/todos/presentation/blocs/todos/todo_bloc.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/todoList/modal/update_dialog_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/info_todo_widget.dart';

class TodoCardWidget extends StatefulWidget {
  final String taskName, description;
  final String id;
  final bool isChecked, isLoading;
  final DateTime deadline;
  final ValueChanged<bool?> onChange;
  final DismissDirectionCallback onDissmissed;
  final Todos todosData;
  
  
  const TodoCardWidget({
      super.key, 
      required this.taskName, 
      required this.description, 
      required this.isChecked, 
      required this.onChange,
      required this.isLoading,
      required this.id,
      required this.onDissmissed,
      required this.deadline,
      required this.todosData
  });



  @override
  State<TodoCardWidget> createState() => TodoCardWidgetState();
}








class TodoCardWidgetState extends State<TodoCardWidget> {
  
  // late Duration selisih;
  
  // late bool _isChecked;



  String getKeteranganWaktu (DateTime deadline){
      final now = DateTime.now();
      final durasi = deadline.difference(now);

      if (durasi.inSeconds < 0) {
        // Sudah lewat
        final lewat = now.difference(deadline);
        if (lewat.inDays >= 1) return 'Sudah lewat ${lewat.inDays} hari';
        if (lewat.inHours >= 1) return 'Sudah lewat ${lewat.inHours} jam';
        if (lewat.inMinutes >= 1) return 'Sudah lewat ${lewat.inMinutes} menit';
        return 'Sudah lewat beberapa detik';
      } else {
        // Masih ada waktu
        if (durasi.inDays >= 1) return '${durasi.inDays} hari lagi';
        if (durasi.inHours >= 1) return '${durasi.inHours} jam lagi';
        if (durasi.inMinutes >= 1) return '${durasi.inMinutes} menit lagi';
        return 'Beberapa detik lagi';
      }
  }







  // @override
  // void initState() {
  //   super.initState();
  //   selisih = widget.deadline.difference(DateTime.now());
  // }


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        // color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.delete, color: Color.fromARGB(255, 255, 0, 0)),
            Text('Delete', style: TextStyle(color: Colors.red[700], fontSize: 12)),
          ],
        ),
      ),

      onDismissed: widget.onDissmissed,
      
      
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.black,
            width: 1
          )
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            // style: ListTileStyle.,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   side: const BorderSide(
            //     color: Color.fromARGB(157, 0, 0, 0),
            //     width: 1,
            //   ),
            // ),
            
            

            
            onTap: () async {
              final result = await showDialog<Todos>(
                context: context,
                builder: (_) => BlocProvider.value(
                    value: context.read<TodoBloc>(),
                    child: UpdateDialogWidget(todosData: widget.todosData ,)
                  )
                
              ); 
              
              
              // Cek apakah ada data yang kembali
              if (result != null) {
                print(result.id + " " + result.title + " " + result.description + " " + result.isChecked.toString() + " " + result.createdAt.toString() + " " + result.deadline.toString());
                context.read<TodoBloc>().updateTodosData(result);
              }
              
            },
            
            

            
            // isThreeLine: true,
            tileColor: const Color.fromARGB(255, 255, 255, 255),
            minLeadingWidth: 30,
            leading: const Icon(
              Icons.sticky_note_2,
              size: 29,
            ),
            
            contentPadding: EdgeInsets.all(8),
            
            title:  Text(
              widget.taskName,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            
            
            
            subtitle: Text(
              widget.description,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w400),
            ),
          
            
            
            trailing: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 15,
              children: [
                widget.isChecked ?  InfoTodoWidget(info: "selesai", date: DateFormat('dd/MMM/yyyy - HH:mm').format(widget.deadline) ,) : InfoTodoWidget(info: "${GetKeteranganWaktuUseCase(deadline: widget.deadline).getKeteranganWaktu()}", date:  DateFormat('dd/MMM/yyyy - HH:mm').format(widget.deadline),),
                const SizedBox(
                  width: 5,
                ),
                
                
                AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: widget.isLoading ? 
              const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator()
              ) 
              
              :
                // _isChecked ? 
                // const Icon(
                //   Icons.check_circle_outline,
                //   color: Colors.green,
                // )
                Checkbox(
                  activeColor: const Color.fromARGB(255, 70, 138, 255),
                  value: widget.isChecked, 
                  onChanged: widget.onChange,
                  //  widget.onPress,
                  
                  ),
                
          )
            
                
                
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}

