import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todolist_app/features/todos/domain/entities/todos.dart';
import 'package:todolist_app/features/todos/presentation/blocs/todos/todo_bloc.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/todoList/modal/add_dialog_widget.dart';
import 'package:uuid/uuid.dart';





class AddButtonWidget extends StatefulWidget {
  final VoidCallback onpress;
  const AddButtonWidget({super.key, required this.onpress});

  @override
  State<AddButtonWidget> createState() => _AddButtonWidgetState();
}

class _AddButtonWidgetState extends State<AddButtonWidget> {
  List<double> shadowOffset = [5, 7];
  String ket = "hihihh";
  List<Color> bgButton = [const Color.fromARGB(138, 86, 9, 218), const Color.fromARGB(165, 116, 45, 239)];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // color: const Color(0xFF5409DA),
      // padding: const EdgeInsets.all(20),
      duration: Duration(milliseconds: 500),      
      margin: const EdgeInsets.only(right: 25, bottom: 25),
      
      
      
      
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [bgButton[0], bgButton[1]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          ),
        

        color: const Color.fromARGB(223, 84, 119, 146),
        borderRadius: BorderRadius.circular(20),

        // boxShadow: [
        //   BoxShadow(
        //       color: Colors.black,
        //       offset: Offset(shadowOffset[0], shadowOffset[1]),
        //       blurRadius: 1)
        // ],

        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 1,
        ),
      ),





      
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // elevation: 10,
          padding: EdgeInsets.all(22),
          backgroundColor: Colors.transparent,
          // shadowColor: const Color.fromARGB(255, 0, 0, 0),
          
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(20),
            // side: BorderSide(
            //   color: const Color.fromARGB(255, 255, 255, 255),
            //   width: 2
            // )
          )
        ),

        
        
        
        
        





        
        child: const Text(
          "+  Tambah todo ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color:  Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
            fontSize: 15
          ),
        ),
        
        
        
        

        
        onPressed: () async {
          // context.read<TodoBloc>().updateTodosData(
          //   Todos(
          //     id: 'fdf14460-361f-44cb-9267-4e602c2d9bb2',
          //     title: 'oi zulpiiiiiiii',
          //     description: 'loremipsumdolorsitamet',
          //     isChecked: false,
          //     createdAt: DateTime.now(),
          //     deadline: DateTime.now(),
          //   )
          // );

          // await Supabase.instance.client.from('todos')
          //       .update({
          //           'title': 'pesan dari lorem',
          //           'description': 'hi lorem',
          //           'deadline': DateTime.now().toUtc().toIso8601String(),
          //         }).eq('id', 'fdf14460-361f-44cb-9267-4e602c2d9bb2').select();
          final result = await showDialog<Todos>(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<TodoBloc>(),
            child: const ConfirmationDialogWidget(),
          ),
        );


        setState(() {
          ket = "$result";
        });
        
        

        // Cek apakah ada data yang kembali
        if (result != null) {
          context.read<TodoBloc>().addTodo(result); // ✅ tambah ke Bloc
        }
          
          
          
          
          setState(() {
              if(shadowOffset[0] == 0 && shadowOffset[1] == 0){
                shadowOffset = [5, 7];
                bgButton = [const Color.fromARGB(138, 86, 9, 218), const Color.fromARGB(165, 116, 45, 239)];
              }else{
                shadowOffset = [0, 0];
                bgButton = [const Color.fromARGB(255, 112, 41, 235), const Color.fromARGB(209, 255, 255, 255)];
              }
          });
        },
        
        
        
        
      ),
    );
  }
}
