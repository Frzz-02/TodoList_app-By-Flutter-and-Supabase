import 'package:flutter/material.dart';

class DateCardWidget extends StatefulWidget {
  final String day, date;
  final bool state;
  final VoidCallback onClickBtn;
  const DateCardWidget({super.key, required this.date, required this.day, required this.state , required this.onClickBtn});

  @override
  State<DateCardWidget> createState() => _DateCardWidgetState();
}

class _DateCardWidgetState extends State<DateCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 170,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),







      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: widget.state ? const Color.fromARGB(191, 76, 201, 254) : Colors.white,
        boxShadow:  [
          BoxShadow(
              color: widget.state ? Color.fromARGB(43, 0, 0, 0) : Color.fromARGB(12, 0, 0, 0),
              offset: Offset(10, 10),
              blurRadius: 5)
        ],
        border: Border.all(
          color: const Color.fromARGB(110, 15, 15, 15),
          width: 1,
        ),
      ),










      child: ElevatedButton(
        onPressed: widget.onClickBtn,
        
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(39)
          )
        ),



        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.date, // (text != "hi") ? date[sdate.key] : text,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: widget.state ? Colors.white : const Color.fromARGB(255, 0, 0, 0)),
            ),

            
            const SizedBox(
              height: 3,
            ),


            Text(
              widget.day,
              style: TextStyle(
                  fontSize: 17, color: widget.state ? Colors.white : const Color.fromARGB(255, 0, 0, 0)),
            ),
          ],),
      ),
    );
  }
}
