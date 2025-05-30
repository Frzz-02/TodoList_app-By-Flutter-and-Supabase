// import '../repositories/todos_repository.dart';

class GetKeteranganWaktuUseCase {
  final DateTime deadline;
  const GetKeteranganWaktuUseCase({required this.deadline});
  

    String getKeteranganWaktu (){
      final now = DateTime.now();
      final durasi = deadline.difference(now);

      if (durasi.inSeconds < 0) {
        // Sudah lewat
        final lewat = now.difference(deadline);
        if (lewat.inDays >= 1) return 'Sudah lewat ${lewat.inDays} hari';
        if (lewat.inHours >= 1) return 'Sudah lewat ${lewat.inHours} jam';
        if (lewat.inMinutes >= 1) return 'Sudah lewat ${lewat.inMinutes} menit';
        return 'Sudah lewat beberapa detik';
      } else {
        // Masih ada waktu
        if (durasi.inDays >= 1) return '${durasi.inDays} hari lagi';
        if (durasi.inHours >= 1) return '${durasi.inHours} jam lagi';
        if (durasi.inMinutes >= 1) return '${durasi.inMinutes} menit lagi';
        return 'Beberapa detik lagi';
      }
  }
}
