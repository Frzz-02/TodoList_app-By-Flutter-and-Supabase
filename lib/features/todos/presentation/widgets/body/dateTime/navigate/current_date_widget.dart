import 'package:flutter/material.dart';

class CurrentDateWidget extends StatefulWidget {
  final String currentFormattedDate;
  final List<dynamic> formatedDateFromButtonBlocS;
  final VoidCallback onPress;
  const CurrentDateWidget({super.key, required this.onPress, required this.formatedDateFromButtonBlocS, required this.currentFormattedDate});

  @override
  State<CurrentDateWidget> createState() => _CurrentDateWidgetState();
}

class _CurrentDateWidgetState extends State<CurrentDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(168, 0, 0, 0),
              offset: Offset(3, 3),
              blurRadius: 3)
        ],
        color: const Color.fromARGB(255, 224, 236, 243),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.black,
          width: 0,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(11, 0, 0, 0),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
        ),
        onPressed: widget.onPress,
        child:  Text(
          "${(widget.currentFormattedDate == widget.formatedDateFromButtonBlocS[1])} yang ada di button state : ${widget.formatedDateFromButtonBlocS[1]}, tanggal sekarang : ${widget.currentFormattedDate}",
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
      ),
    );
  }
}
