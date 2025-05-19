import 'package:flutter/material.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/navigate/arrow_next_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/navigate/arrow_prev_widget.dart';
import 'package:todolist_app/features/todos/presentation/widgets/body/dateTime/navigate/month_widget.dart';






class PrevNextDateWidget extends StatelessWidget {
  final List<VoidCallback> onpress;
  final String month;
  const PrevNextDateWidget({super.key, required this.month, required this.onpress});



  @override
  Widget build(BuildContext context) {
    return  Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 7,
      children: [
        ArrowPrevWidget(
          onPress: onpress[0],
        ),
        
        
        MonthWidget(
          month: month,
        ),


        ArrowNextWidget(
          onPress: onpress[1],
        )
      ],
    );
  }
}