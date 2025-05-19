
import 'package:flutter_bloc/flutter_bloc.dart';



class ButtonBloc extends Cubit<List<dynamic>> {
  ButtonBloc() : super([DateTime.now().day, "${DateTime.now().day.toString()}-${DateTime.now().month.toString()}"]);


    List<String> months = [
    'January', 'February', 'March',
    'April', 'May', 'June',
    'July', 'August', 'September',
    'October', 'November', 'December'
  ];
  

  void onClickBt(int index, String date, String month) {
    int monthNumber = months.indexOf(month) + 1;
    emit([index, "$date-$monthNumber"]);  
  } 
}
