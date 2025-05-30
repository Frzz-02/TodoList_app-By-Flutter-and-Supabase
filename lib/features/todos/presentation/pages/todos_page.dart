import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todolist_app/features/todos/data/repositories/todos_repository_impl.dart';
import 'package:todolist_app/features/todos/domain/entities/todos.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_all_dates_in_year_use_case.dart';
import 'package:todolist_app/features/todos/presentation/blocs/button/button_bloc.dart';
import 'package:todolist_app/features/todos/presentation/blocs/dateTime/date_time_bloc.dart';
import 'package:todolist_app/features/todos/presentation/blocs/todos/todo_bloc.dart';
import 'package:todolist_app/features/todos/presentation/widgets/add_button_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/appBar/actions_icon_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/appBar/leading_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/appBar/title_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/date_box_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/date_card_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/navigate/current_date_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/navigate/prev_next_date_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/todoList/loading__widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/todoList/toast_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/todoList/todo_card_widget.dart';
import 'package:uuid/uuid.dart';

// bool isLoaded = true;

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DateTimeBloc(
            dates: GetAllDatesInYearUseCase().call(DateTime.now().year),
          ),
          // child: ,
        ),
        BlocProvider(
          create: (_) => TodoBloc(
              repository: TodosRepositoryImpl(Supabase.instance.client))
            ..getAllTodos(),
        ),
        BlocProvider(create: (_) => ButtonBloc())
      ],
      child: const TodosView(),
    );
  }
}

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => TodosViewState();
}

class TodosViewState extends State<TodosView> {
  List<Todos> localTodos = [];

  @override
  Widget build(BuildContext context) {
  bool selectedBt;

 

    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          leadingWidth: 70,
          backgroundColor:  const Color.fromARGB(237, 29, 146, 242),
          leading: const LeadingWidget(),
          title: const TitleWidget(),
          elevation: 7,
          shadowColor: Colors.black,
        


          actions: const [
            Wrap(spacing: 5, children: [
              ActionsIconWidget(
                tooltip: 'Ubah Tema',
                icon: Icons.contrast_outlined,
              ),
              ActionsIconWidget(
                tooltip: 'Logout',
                icon: Icons.logout,
              ),
              SizedBox(
                width: 10,
              )
            ]),
          ],
        ),
        
        


        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton:  BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return AddButtonWidget(
              onpress: () {
                // context.read<TodoBloc>().updateTodosData(
                //   Todos(
                //     id: 'fdf14460-361f-44cb-9267-4e602c2d9bb2',
                //     title: 'pesan dari lorem-lorem ipsum',
                //     description: 'loremipsumdolorsitamet',
                //     isChecked: false,
                //     createdAt: DateTime.now(),
                //     deadline: DateTime.now(),
                //   )
                // );
              },
            );
          }
        ),
        
        
        
        
        
        
        
        
        
        
        body: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DateBoxWidget(),
            
            
            
                      BlocBuilder<DateTimeBloc, DateTimeState>(
                            builder: (context, state) {
                              
                              
                          List<Map<String, dynamic>> selectDates = (state as CurrentDates).selectedDates;
                          
                          String monthDateTimeState =  state.month,
                                     currentDateFormat = "${DateTime.now().day.toString()}-${DateTime.now().month.toString()}";
            
                          int monthIndex = context.read<DateTimeBloc>().crSelectedMonthIndex();
            
                          List<dynamic> formatedDateFromButtonBlocS = context.watch<ButtonBloc>().state,
                                          // monthIndex = selectDates[0][monthDateTimeState]['date'].toString().split('-'),
                                            day = state.day(), 
                                              date = state.date(); 
            
            
            
            
            
            
            
                return Column(
                  children: [
                    ScrollConfiguration(
                      behavior: const ScrollBehavior().copyWith(
                        scrollbars: false,
                        dragDevices: {
                          PointerDeviceKind.mouse, //agar scroll bisa di mouse
                          PointerDeviceKind.touch, //agar scroll bisa di touch
                        },
                      ),
                      child: SizedBox(
                        height: 200,
                        // padding: const EdgeInsets.all(1),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                    
                          // itemExtent: ,
                          children: [
                            
                    
                              Wrap(
                                spacing: 7,
                                children: selectDates.asMap().entries.map((sdate) {
                                  return BlocBuilder<ButtonBloc, List<dynamic>>(
                                    // kita pakai blocbuilder di dalam looping map agar setiap item yang berada dalam iterasi ini memiliki statenya masing masing
                                    builder: (context, buttonState) {
                                    
                                    // ini nanti akan mencocokkan item yang muncul untuk dikasih styling
                                    // styling warna biru button ketika salah satu tanggal diklik
                                     selectedBt = buttonState[0] == sdate.key; 
                                      // print('index ke-${sdate.key} = ${selectedBt}');
                    
                                      return DateCardWidget(
                                        
                                        date: date[sdate.key],
                                        day: day[sdate.key].toString().substring(0, 3),
                                        state: selectedBt,
                                        onClickBtn: () {
                                        
                                        context
                                            .read<ButtonBloc>()
                                            .onClickBt(sdate.key, date[sdate.key], context.read<DateTimeBloc>().crSelectedMonthIndex());
                                        } 
                                      );
                                    },
                                  );
                                }).toList(),
                              )
                            
                          ],
                        ),
                      ),
                    ),
                  
            
            
            
            
            
            
            
            
            
            
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            
                    CurrentDateWidget(
                      formatedDateFromButtonBlocS: formatedDateFromButtonBlocS,
                      currentFormattedDate: currentDateFormat,
            
                      onPress: () {
                        
                          if(DateTime.now().month != monthIndex + 1) context.read<DateTimeBloc>().moveToCurrentMonth(DateTime.now().month);                        
                          
                          
                                context.read<ButtonBloc>().onClickBt(
                                  DateTime.now().day - 1, DateTime.now().day.toString(), 
                                  context.read<DateTimeBloc>().crMonthIndexNow()
                                );
                                
                          print("\n\nbulan dari fingsi bawaan : ${DateTime.now().month.toString()}  \nbulan dari variabel month : $monthDateTimeState \nindex bulan saat ini (dari variabel monthIndex, didapat dari method crindex() di datetimebloc) : ${monthIndex + 1}  \ncek kesamaan bulan : ${monthIndex + 1 == DateTime.now().month}");
                          
                      },
            
                    ),
                                      
            
                     PrevNextDateWidget(
                      month: "$monthDateTimeState",
                      // \n\n current indexM cubit : ${context.read<DateTimeBloc>().crSelectedMonthIndex()}",
                      onpress: [
                        () {
                          context.read<DateTimeBloc>().prevMonth();
                          context.read<ButtonBloc>().onClickBt(0, date[0], context.read<DateTimeBloc>().crSelectedMonthIndex());
                        },
            
            
                        (){
                          context.read<DateTimeBloc>().nextMonth();
                          context.read<ButtonBloc>().onClickBt(0, date[0], context.read<DateTimeBloc>().crSelectedMonthIndex());
                          // print(date);
                        }
                      ],),
                
                  ],),
                ],);
            }),
            
            
            
            
            
            
            
                Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: const EdgeInsets.only(top: 30),
                  child: Stack(
                    children: [
                      BlocBuilder<TodoBloc,TodoState>(
                        buildWhen: (previous, current) => previous != current,
                        builder: (context, status) {
                          
                      
  
                      if(status is Successful){
                        
                          //  ToastWidget(message:  status.message);
                           WidgetsBinding.instance.addPostFrameCallback((_){
                                  MotionToast(
                                      width: 400,
                                      height: 70,
                                      secondaryColor: const Color.fromARGB(255, 120, 255, 194),
                                      primaryColor: const Color(0xFF5CB338),
                                      icon: Icons.check_circle_outline,
                                      contentPadding: const EdgeInsets.only(left: 10),
                                      animationType: AnimationType.slideInFromBottom,
                                      toastAlignment: Alignment.bottomRight,
                                      iconSize: 35,
                                      toastDuration: const Duration(seconds: 3),
                                      title: const Text('Successful', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                      description: Text(status.message, style: const TextStyle(color: Colors.white),),
                                      // barrierColor: const Color.fromARGB(255, 255, 0, 0),
                                      displaySideBar: true,
                                    ).show(context);
                            });
                           
                          }else if (status is TodoLoading && status.information == "fetch") {
                            
                            return const Center(
                              // child: CircularProgressIndicator(),
                                child: Column(
                                  children: [
                                    LoadingWidget(image: "assets/anime-loading.gif",),
                                     SizedBox(height: 10,),
                                     Text("Tunggu sebentar yah...", style: TextStyle(fontSize: 15,), textAlign: TextAlign.center,)
                                  ],
                                ),
                              );
                              
                          }
                          
                          
                          
                          
                    
                          
                          // jika status == todoLoaded, maka simpan datanya ke local todos
                          if(status is TodoLoaded){
                            localTodos = status.data;
                          }
                      
                          // jika localtodos ada 
                          if (localTodos.isNotEmpty){
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: localTodos.length,
                              itemBuilder: (_, i){
                                
                                return TodoCardWidget(
                                      // "\n status sekarang : ${status},  status pengecekan : ${localTodos[i].isChecked}", 
                                      todosData: localTodos[i],
                                      taskName: localTodos[i].title,
                                      description:  localTodos[i].description, 
                                      isChecked: localTodos[i].isChecked,
                                      isLoading: (status is TodoLoading && status.information == "update:${localTodos[i].id}"),
                                      id: localTodos[i].id,
                                      deadline:  localTodos[i].deadline.toLocal(),

                                      
                                      onChange: (value){
                                        // print('$status.{information}');
                                        context.read<TodoBloc>().updateTodosStatus(
                                              localTodos[i].id, 
                                              value ?? false
                                          );
                                      },
                                      
                                      
                                      
                                      onDissmissed: (direction) {
                                        context.read<TodoBloc>().delTodo(localTodos[i].id, localTodos[i].title);
                                        setState(() {
                                          localTodos.removeAt(i);
                                        });
                                      }, 
                                
                                
                                  );
                              });
                              // localTodos = [];
                          }else if (localTodos.isEmpty && status is TodoLoaded) {
                            return const Center(

                              child: Column(
                                children: [
                                  LoadingWidget(image: "assets/data-doesn't-exist.gif"),
                                  SizedBox(height: 10,),
                                  Text("Yah belum ada tugas nihh, untuk menambah tugas baru bisa klik button di bawah yaa...", style: TextStyle(fontSize: 15, color: Colors.black),),
                                ],
                              ),
                            );
                          }
                                    
                                  
                                  
                                  
                                  
                          if(status is TodoError){
                            return Center(
                              child: Text(status.message, style: const TextStyle(color: Colors.black, fontSize: 15),),
                            );
                          }
                                                     
                                  
                                return Text("");  
                                  
                          
                        }),
                    ],
                  ),
                ),
            
              
              ],),
          ),
        ),
      ),
    );
  }
}