import 'package:flutter/material.dart';
import 'package:todolist_app/features/todos/domain/entities/todos.dart';

class UpdateDialogWidget extends StatefulWidget {
  final Todos todosData;
  
  const UpdateDialogWidget({
    super.key,
    required this.todosData,
    });
    
    

  @override
  State<UpdateDialogWidget> createState() => _UpdateDialogWidgetState();
}







class _UpdateDialogWidgetState extends State<UpdateDialogWidget> {
  bool edit = false;
  String get btName => edit ? "Simpan" : "Edit";
  final TextEditingController _deadlineController = TextEditingController();
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController = TextEditingController();
    DateTime? _selectedDate;
    late String timeUtc ;


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
  timeUtc = utc.toIso8601String();
  _deadlineController.text = utc.toLocal().toString().split(':')[0].split(' ')[0] + '  ' + utc.toLocal().toString().split(':')[0].split(' ')[1] + ':' + utc.toLocal().toString().split(':')[1];
  print(timeUtc);
  _selectedDate = combinedDateTime;
}
  




    @override
  void initState() {
    super.initState();
    timeUtc = widget.todosData.deadline.toUtc().toIso8601String();
    print(timeUtc);
    _titleController.text = widget.todosData.title;
    _descriptionController.text = widget.todosData.description;
    _deadlineController.text = widget.todosData.deadline.toLocal().toString().split(':')[0].split(' ')[0] + '  ' + widget.todosData.deadline.toLocal().toString().split(':')[0].split(' ')[1] + ':' + widget.todosData.deadline.toLocal().toString().split(':')[1];
  }
  
  
  
  
  

  @override
  void dispose() {
    _deadlineController.dispose(); // ✅ penting!
    _titleController.dispose(); // ✅ penting!
    _descriptionController.dispose(); // ✅ penting!
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      
      
      
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
        height: 585,
        width: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 2,
          )
        ),
        
        
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






            const SizedBox(height: 10,),
            

            
            
            
            const Text(
              'Edit Tugas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            
            
            
            
            
            const SizedBox(height: 5),
            const Text('Klik edit data tugas untuk memperbarui data tugas yang ada'),
            const SizedBox(height: 55),
            








           Align(
            alignment: Alignment.centerLeft,
            child: Text("${edit ? "Masukkan j" : "J"}udul tugas : ", textAlign: TextAlign.start, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
          ),
          const SizedBox(height: 10,),
          
          
                      TextFormField(    
                        controller: _titleController,
                        // initialValue: widget.todosData.title,
                        readOnly: edit ? false : true,
                        style: const TextStyle(fontSize: 14),
                        decoration:  InputDecoration(
                          hintText: 'Contoh: Belajar flutter',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          prefixIcon: const Icon(Icons.book_outlined),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            )
                          )
                          
                        ),
                      ),
          
          
          
          
          
          
                const SizedBox(height: 28,),
          
          
          
          
          


          
          
                       Align(
                        alignment: Alignment.centerLeft,
                        child: Text(edit ? "Masukkan Deskripsi tugas (opsional) :" : "Deskripsi tugas :", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
                      const SizedBox(height: 10,),
           
                      TextFormField(
                        controller: _descriptionController,
                        readOnly: edit ? false : true,
                        // initialValue: widget.todosData.description,
                        style:  const TextStyle(fontSize: 14),
                        scrollPadding: const  EdgeInsets.all(50),
                        decoration:  InputDecoration(
                          hintText: 'Contoh: Belajar Flutter sampai selesai',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                          prefixIcon: const Icon(Icons.description_outlined),
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            )
                          )
                          
                        ),
                      ),

                      
                      

                        const SizedBox(height: 25,),
                      
                      
                      
                      
                      
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Text("Masukkan Deskripsi tugas (opsional) : ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                      // SizedBox(height: 7,),
          

          
                      Container(
                        margin: const EdgeInsets.only(left: 500),
                        // width: 200,
                        child: TextFormField(
                          controller:  _deadlineController,
                          onTap: edit ? _pickDateTime : null,
                          // hintText: 'Contoh: Belajar Flutter sampai selesai',
                          // initialValue: widget.todosData.deadline.toLocal().toString(),
                          readOnly: true,
                          style: const TextStyle(fontSize: 12),
                          scrollPadding: const EdgeInsets.all(50),
                          decoration:  InputDecoration(
                          labelStyle: const TextStyle(fontSize: 13),
                            
                            labelText: "${edit ? "Masukkan d" : "D"}eadline tugas : ",// '${edit ? "Masukkan deadline tugas" : "${widget.todosData.deadline}"}',
                            contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                            prefixIcon: const Icon(Icons.calendar_today),
                            
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              )
                            )
                            
                          ),
                        ),
                      ),


            
            
            
            
                const SizedBox(height: 35,),







              SizedBox(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      
                
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(  
                      backgroundColor: edit ? const Color.fromARGB(255, 7, 217, 126) : const Color(0xFFFFB433),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),                
                    
                    
                    onPressed: () {
                      if (!edit) {
                        setState(() {
                          edit = true;
                       });
                        return;
                      }
                        
                          
                          final title = _titleController.text.trim();
                          final desc = _descriptionController.text.trim();
                          final deadlineText = timeUtc.trim();
                          
                          
                          
                              // ✅ Validasi sederhana
                          if (title.isEmpty || deadlineText.isEmpty) return;

                          DateTime? parsedDeadline;
                          try {
                            parsedDeadline = DateTime.parse(deadlineText);
                          } catch (e) {
                            parsedDeadline = DateTime.parse(widget.todosData.deadline.toUtc().toIso8601String());
                          }
                          

                          
                          final updatedTodos = Todos(
                            id: widget.todosData.id,
                            title: title,
                            description: desc,
                            deadline: parsedDeadline,
                            isChecked:  widget.todosData.isChecked,
                            createdAt: widget.todosData.createdAt
                          );
                          Navigator.of(context).pop(updatedTodos);
                        },
                    
                
                
                    child: Text(btName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                  ),
                
                  
                  
                  
                  
                  
                  
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      // backgroundColor: const Color(0xFFFFB433),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color.fromARGB(149, 102, 0, 255), width: 1)
                    ),
                    onPressed: (){
                      Navigator.of(context).pop(); // Tutup dialog
                    }, 
                    child: const Text('Batal'),
                  ),
                
                  
                  
                  
                  ],),
              ),







          ],),
      )
    );
  }
}
