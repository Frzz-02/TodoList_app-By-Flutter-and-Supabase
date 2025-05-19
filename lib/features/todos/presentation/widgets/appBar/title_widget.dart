import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Wrap(
          spacing: 10,


          children: [
            SizedBox(width: 0,),


            Icon(Icons.home),


            Text(
              'Todo List App',

              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),







          ],),
      ],);





  }
}
