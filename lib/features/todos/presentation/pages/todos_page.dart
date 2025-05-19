import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todolist_app/features/todos/data/repositories/todos_repository_impl.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_all_dates_in_year_use_case.dart';
import 'package:todolist_app/features/todos/presentation/blocs/button/button_bloc.dart';
import 'package:todolist_app/features/todos/presentation/blocs/dateTime/date_time_bloc.dart';
import 'package:todolist_app/features/todos/presentation/blocs/todos/todo_bloc.dart';
import 'package:todolist_app/features/todos/presentation/widgets/appBar/actions_icon_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/appBar/leading_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/appBar/title_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/date_box_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/date_card_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/navigate/current_date_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/navigate/prev_next_date_widget.dart';

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
  // late final GetTodos getTodos;

  // final todoRepo = TodosRepositoryImpl(supabase);

  // // dateTime
  // late final List< Map<String,dynamic>> selectDates;
  // List< Map<String,dynamic>> dates = [];
  // int monthIndex = 0;
  // List<String> months = [
  //   'January',
  //   'February',
  //   'March',
  //   'April',
  //   'May',
  //   'June',
  //   'July',
  //   'August',
  //   'September',
  //   'October',
  //   'November',
  //   'December'
  // ];

  // List<Todos> todos = [];

  // @override
  // void initState() {
  //   super.initState();
  //   // final todoRepo = TodosRepositoryImpl(Supabase.instance.client);
  //   final date = GetAllDatesInYearUseCase();
  //   // getTodos = GetTodos(repository: todoRepo);
  //   dates.addAll(date(DateTime.now().year)); //menabahkan data tanggal ke dalam list dates
  //   selectDates = dates.where((date) => date[months[monthIndex]] != null).toList();
  //   fetchTodo();
  // }

  // Future<void> fetchTodo() async {
  //   final data = await getTodos();
  //   print('$data');
  //   setState(() {
  //     todos = data;
  //     isLoaded = false;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
  bool selectedBt;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70,
          backgroundColor: const Color.fromARGB(237, 29, 146, 242),
          leading: const LeadingWidget(),
          title: const TitleWidget(),
          elevation: 7,
          shadowColor: Colors.black,
          actions: [
            Wrap(spacing: 5, children: [
              ActionsIconWidget(
                tooltip: 'Ubah Tema',
                icon: Icons.contrast_outlined,
              ),
              ActionsIconWidget(
                tooltip: 'Logout',
                icon: Icons.logout,
              ),
              const SizedBox(
                width: 10,
              )
            ]),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DateBoxWidget(),



              BlocBuilder<DateTimeBloc, DateTimeState>(
                          //nanti diganti dgn bloc selector utk pemisahan state datetime dan onclick
                          builder: (context, state) {
                        List<Map<String, dynamic>> selectDates = (state as CurrentDates).selectedDates;
                        String monthDateTimeState = state.month;
                        List<dynamic> formatedDateFromButtonBlocS = context.watch<ButtonBloc>().state;
                        List<dynamic> day = state.day();
                        List<dynamic> date = state.date();
                        final monthIndex = selectDates[0][monthDateTimeState]['date'].toString().split('-');
                        String currentDateFormat = "${DateTime.now().day.toString()}-${DateTime.now().month.toString()}";







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
                                          .onClickBt(sdate.key, date[sdate.key], monthDateTimeState);
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
                      
                        if(DateTime.now().month != int.parse(monthIndex[1])) context.read<DateTimeBloc>().moveToCurrentMonth(DateTime.now().month - 1);                        
                        context.read<ButtonBloc>().onClickBt(DateTime.now().day - 1, DateTime.now().day.toString(), monthDateTimeState);
                        print("\n\nbulan dari fingsi bawaan : ${DateTime.now().month.toString()}  \nbulan dari variabel month : $monthDateTimeState \nindex bulan saat ini (dari variabel monthIndex) : ${monthIndex[1]}  \ncek kesamaan bulan : ${int.parse(monthIndex[1]) == DateTime.now().month}");
                        
                    },

                  ),
                                    
                  
                // current date btn :
                  // onpress : 
                        // print('monthIndex : $monthIndex');
                        // if(DateTime.now().month != int.parse(monthIndex[1])){
                        //   context.read<DateTimeBloc>().moveToCurrentMonth(DateTime.now().month - 1);
                        // }
                        // context.read<ButtonBloc>().onClickBt(DateTime.now().day - 1, DateTime.now().day.toString(), month);

                        // print("\n\nbulan dari fingsi bawaan : ${DateTime.now().month.toString()}  \nbulan dari variabel month : $month \nindex bulan saat ini (dari variabel monthIndex) : ${monthIndex[1]}  \ncek kesamaan bulan : ${int.parse(monthIndex[1]) == DateTime.now().month}");

                  // text : 
                        // "${(dateNow == dateTime[1])} yang ada di button state : ${dateTime[1]}, tanggal sekarang : $dateNow", // '${context.read<ButtonBloc>().}',




                   PrevNextDateWidget(
                    month: monthDateTimeState,
                    onpress: [
                      () {
                        context.read<DateTimeBloc>().prevMonth();
                          context.read<ButtonBloc>().onClickBt(0, date[0], monthDateTimeState);
                      },


                      (){
                        context.read<DateTimeBloc>().nextMonth();
                        // print(date);
                        context.read<ButtonBloc>().onClickBt(0, date[0], monthDateTimeState);
                      }
                    ],
                   ),

// punya prev_month
    // context.read<DateTimeBloc>().prevMonth();
    //   context.read<ButtonBloc>().onClickBt(0, date[0], month);


// punya nextmont
    // context.read<DateTimeBloc>().nextMonth();
    // print(date);
    // context.read<ButtonBloc>().onClickBt(0, date[0], month);


// punya month
// month
                
                ],),
              ],);


}),



              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                margin: const EdgeInsets.only(top: 50),
                child: ListView(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      child: ListTile(
                        // style: ListTileStyle.,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color.fromARGB(157, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                        // isThreeLine: true,
                        tileColor: const Color.fromARGB(255, 255, 255, 255),
                        minLeadingWidth: 30,
                        leading: const Icon(
                          Icons.sticky_note_2,
                          size: 27,
                        ),
                        title: const Text(
                          'Belajar Flutter',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        subtitle: const Text(
                          'Belajar Flutter dari awal sampai akhir',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        trailing: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 15,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 5),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(133, 10, 189, 7),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  'Selesai',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}