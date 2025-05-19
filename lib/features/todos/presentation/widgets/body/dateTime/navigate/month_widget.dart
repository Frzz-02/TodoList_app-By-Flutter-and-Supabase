import 'package:flutter/material.dart';

class MonthWidget extends StatefulWidget {
  final String month;
  const MonthWidget({super.key, required this.month});

  @override
  State<MonthWidget> createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 72,
      child: Text(
        widget.month,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      ),
    );
  }
}
