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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      // margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        boxShadow:  [
          BoxShadow(
              color: (widget.currentFormattedDate == widget.formatedDateFromButtonBlocS[1]) ? Colors.transparent : Color.fromARGB(168, 0, 0, 0),
              offset: Offset(3, 3),
              blurRadius: 3)
        ],
        color: (widget.currentFormattedDate == widget.formatedDateFromButtonBlocS[1]) ? const Color.fromARGB(204, 48, 139, 230) : const Color.fromARGB(255, 224, 236, 243),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: (widget.currentFormattedDate == widget.formatedDateFromButtonBlocS[1]) ? const Color.fromARGB(155, 0, 0, 0) : Colors.black,
          width: 0,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(10, 255, 255, 255),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
        ),
        onPressed: widget.onPress,
        child:  Text(
          "Today",
          //  yang ada di button state : ${widget.formatedDateFromButtonBlocS[1]}, tanggal sekarang : ${widget.currentFormattedDate}",
          style: TextStyle(
              fontSize: 13,
              fontWeight: (widget.currentFormattedDate == widget.formatedDateFromButtonBlocS[1]) ? FontWeight.w600 : FontWeight.w400,
              color: (widget.currentFormattedDate == widget.formatedDateFromButtonBlocS[1]) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
