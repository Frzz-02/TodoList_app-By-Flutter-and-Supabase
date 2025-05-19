import 'package:flutter_test/flutter_test.dart';
import 'package:todolist_app/features/todos/domain/use_cases/get_all_dates_in_year_use_case.dart';

void main() {
  test('DateTime', () {
    // DateTime dateTime = DateTime(2023, 10, 1);
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


    List<Map<String, dynamic>> dates = [];
    final date = GetAllDatesInYearUseCase();


  // dates.addAll(date(2023));
    final dt = date(2023);
    print(dt.runtimeType);

    dates.addAll(dt);
    for (var date2 in dates) {
      if (date2['January'] != null) {
          print('${date2['January']}\n');
      }
    }



    // String formattedDate = dateTime.toString();
    expect(dt, isA<List<Map<String, Map<String, dynamic>>>>());
  });
}
