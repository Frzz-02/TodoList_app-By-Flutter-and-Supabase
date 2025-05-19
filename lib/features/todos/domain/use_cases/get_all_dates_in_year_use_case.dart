class GetAllDatesInYearUseCase {
  List<Map<String, dynamic>> call(int year) {
    List<Map<String, Map<String, dynamic>>> dates = [];

    DateTime currentDate = DateTime(year, 1, 1); // Mulai dari 1 Januari
    DateTime endDate = DateTime(year + 1, 1, 1); // Sampai 1 Januari tahun berikutnya

    while (currentDate.isBefore(endDate)) {
      dates.add({
            _getMonthName(currentDate.month): {

                      //tambahkan data ke dalam list Dates
                      'date': currentDate.toIso8601String().split('T')[0], // Format YYYY-MM-DD, jika tanpa ini .split('T')[0] maka hasilnya adalah YYYY-MM-DDTHH:MM:SS

                      'day': _getDayName(currentDate.weekday),
                      'month' : currentDate.month
                    }
      });
      currentDate = DateTime(currentDate.year, currentDate.month, currentDate.day + 1);
    }
    return dates;
  }

  // note: currentDate.weekday akan mengembalikan nilai 1-7, dengan 1 adalah hari senin, dst sampai 7 adalah hari minggu
  // misal di tanggal 6 adalah hari rabu maka akan mengembalikan nilai 3

  String _getDayName(int weekDay) {
    const days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    return days[weekDay - 1];
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return months[month - 1];
  }
}
