import 'package:flutter/material.dart';

class DateBoxWidget extends StatelessWidget {
  const DateBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(bottom: 28),





      decoration: BoxDecoration(
        color: const Color.fromARGB(223, 84, 119, 146),
        borderRadius: BorderRadius.circular(10),

        boxShadow: const [
          BoxShadow(
              color: Colors.black,
              offset: Offset(10, 10),
              blurRadius: 0)
        ],

        border: Border.all(
          color: const Color.fromARGB(157, 0, 0, 0),
          width: 1,
        ),
      ),





      child: Text(
              DateTime.now().toIso8601String().split('T')[0].split('-')[2] +

                  '/' +
              
                  DateTime.now()
                      .toIso8601String()
                      .split('T')[0]
                      .split('-')[1] +
                      
                  '/' +
              
                  DateTime.now()
                      .toIso8601String()
                      .split('T')[0]
                      .split('-')[0],


        style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
      ),








    );
  }
}
