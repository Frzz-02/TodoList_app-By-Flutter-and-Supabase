import 'package:bloc_test/bloc_test.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_all_dates_in_year_use_case.dart';
import 'package:todolist_app/features/todos/presentation/blocs/dateTime/date_time_bloc.dart';


void main() async {

    blocTest<DateTimeBloc, DateTimeState>(
      'test data todo', 
      
        build: () => DateTimeBloc(dates: GetAllDatesInYearUseCase().call(DateTime.now().year)), // replace with your actual repository
      
        verify: (bloc) {
          // List<Map<String, dynamic>> selectedDates = (bloc.state as CurrentDates).selectedDates;
          // print("$selectedDates");
        },

        
// seed: () => ,
        
        
        act: (bloc) {  
          print("\n\n${(bloc.state as CurrentDates).date()}");
          // bloc.nextMonth();
          // bloc.nextMonth();
        },

    );
}
