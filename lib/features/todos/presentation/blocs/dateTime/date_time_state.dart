part of 'date_time_bloc.dart';

@immutable //immutable adalah annotation yang digunakan untuk menandai bahwa class ini dan turunannya tidak bisa diubah setelah di buat
sealed class DateTimeState {} //sealed membuat class ini tidak bisa di extend di luar file ini

class CurrentDates extends DateTimeState {
  final List<Map<String, dynamic>> selectedDates;
  // final String dateTime;
  final String month;
  CurrentDates({required this.selectedDates, 
                              required this.month, 
                                      // this.dateTime = " "
                                      });



  // CurrentDates copyWith({
  //   List<Map<String,dynamic>>? selectedDates,
  //   String? month,
  //   String? dateTime
  // }){
  //   return CurrentDates(selectedDates: selectedDates ?? this.selectedDates, month: month ?? this.month, dateTime: dateTime ?? this.dateTime);
  // }




  // String getDate () => dateTime;
  List<dynamic> date() => selectedDates.map((dates) => dates[month]['date'].toString().split("-")[2] ).toList();
  List<dynamic> day() => selectedDates.map((days) => days[month]['day']).toList();

  // String change() {
  // }

}









// class CurrentDate extends DateTimeState {
//   final List<Map<String, dynamic>> current;
//   final String month;
//   CurrentDate({required this.current, required this.month});

  
  
//   List<dynamic> date() {
//     return current.map((dates) => dates['date']).toList();
//   }

//   List<dynamic> day() {
//     return current.map((days) => days['day']).toList();
//   }
// }

// final class FailureState extends DateTimeState {
//   final String message;
//   FailureState(this.message);
// }
