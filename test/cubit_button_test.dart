import 'package:bloc_test/bloc_test.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_all_dates_in_year_use_case.dart';
import 'package:todolist_app/features/todos/presentation/blocs/button/button_bloc.dart';
import 'package:todolist_app/features/todos/presentation/blocs/dateTime/date_time_bloc.dart';


void main() async {
// blocTest<DateTimeBloc, DateTimeState>('inherits', build: () => DateTimeBloc(dates: GetAllDatesInYearUseCase().call(DateTime.now().year)),

//     act: (blocDate) {
            blocTest<ButtonBloc, List<dynamic>>(
            'test button date', 
            
              build : () => ButtonBloc(),
            
              verify: (bloc) {
                // print('\n\ndateState : ${blocDate.months}');
                print(bloc.state);
                print("\n\n${DateTime.now().month.toString()}");
                // List<Map<String, dynamic>> selectedDates = (bloc.state as CurrentDates).selectedDates;
                // print("$selectedDates");
              },

              
      // seed: () => ,
              
              
              act: (bloc) { 
                bloc.onClickBt(DateTime.now().day - 1, DateTime.now().day.toString(), DateTime.now().month.toString()) ;
                // print("\n\n${(bloc.state as CurrentDates).date()}");
                // bloc.nextMonth(ss);
                // bloc.nextMonth();
              },

          );
//     },
// );
    // 
}
