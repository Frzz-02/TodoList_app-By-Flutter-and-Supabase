import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todolist_app/features/todos/presentation/pages/todos_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load();

    await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    // url: 'https://ixfvdsuegacynwckkpod.supabase.co',
    // anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml4ZnZkc3VlZ2FjeW53Y2trcG9kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYwMzAyOTAsImV4cCI6MjA2MTYwNjI5MH0.RffV5-KhNW8RIZO7XHZn1zkxaawI--pMRjYRlFSmVLk',
  );

  runApp(const MyApp());
}




final supabase = Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // untuk testing
  //   Future<List<dynamic>> fetchNotes() async {
  //   final response = await supabase.from('todos').select();
  //    if (response == null || response.isEmpty) {
  //       print('Data kosong');
  //       return [];
  //     }

  //     print('Data ditemukan: $response');
  //     return response;
  // }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TodosPage()
    );
  }
}
