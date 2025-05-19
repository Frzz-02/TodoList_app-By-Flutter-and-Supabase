import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_time_state.dart';

class DateTimeBloc extends Cubit<DateTimeState> {
  final List<Map<String, dynamic>> dates;
  DateTimeBloc({required this.dates})
      : super(
          CurrentDates( selectedDates: [], month: "" )
        ){ 
          //inisialisasi selectedDates ketika value dari dates sudah ada
          selectedDates = dates.where((date) => date[months[DateTime.now().month - 1]] != null).toList();
          emit(CurrentDates(selectedDates: selectedDates, month: months[DateTime.now().month - 1]));
        }



  List<String> months = [
    'January', 'February', 'March',
    'April', 'May', 'June',
    'July', 'August', 'September',
    'October', 'November', 'December'
  ];



  int monthIndex = DateTime.now().month - 1;
  late List<Map<String, dynamic>> selectedDates;


int crIndex(){
  return monthIndex;
}



  void prevMonth() {
    if (monthIndex > 0) {
      monthIndex--;
    }
    selectedDates.clear();
    selectedDates.addAll(dates.where((date) => date[months[monthIndex]] != null).toList());
    emit(CurrentDates(selectedDates: selectedDates, month: months[monthIndex]));
  }





// void selectedDateButton(Map<String, String> dateTime){
//   // dateTime = months.indexOf();
//   emit((state as CurrentDates).copyWith(dateTime:""));
// }


void moveToCurrentMonth(int selectMonth){
  monthIndex = selectMonth ;
  selectedDates.clear();
  selectedDates.addAll(dates.where((date) => date[months[selectMonth]] != null).toList());
  emit(CurrentDates(selectedDates: selectedDates, month: months[selectMonth]));
}





  void nextMonth() {
    if (monthIndex < 11) {
      monthIndex++;
    }
    selectedDates.clear();
    selectedDates.addAll(
        dates.where((date) => date[months[monthIndex]] != null).toList());
    emit(CurrentDates(selectedDates: selectedDates, month: months[monthIndex]));
  }
}
