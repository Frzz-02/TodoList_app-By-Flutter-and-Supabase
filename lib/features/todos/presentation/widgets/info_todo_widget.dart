import 'package:flutter/material.dart';

class InfoTodoWidget extends StatefulWidget {
  final String info;
  final String date;
  const InfoTodoWidget({super.key, required this.info, required this.date});

  @override
  State<InfoTodoWidget> createState() => _InfoTodoWidgetState();
}

class _InfoTodoWidgetState extends State<InfoTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      // preferBelow: false,
      verticalOffset: 15,
      message: widget.date,
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 13, vertical: 5),
          decoration: BoxDecoration(
            color: (widget.info == "selesai") ? const Color.fromARGB(255, 10, 189, 7) : const Color.fromARGB(255, 255, 21, 21),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
             widget.info,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          )),
    );
  }
}
