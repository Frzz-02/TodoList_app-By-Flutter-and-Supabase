import 'package:flutter/material.dart';

class ArrowPrevWidget extends StatefulWidget {
  final VoidCallback onPress;
  const ArrowPrevWidget({super.key, required this.onPress});

  @override
  State<ArrowPrevWidget> createState() => _ArrowPrevWidgetState();
}

class _ArrowPrevWidgetState extends State<ArrowPrevWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      
      onPressed: widget.onPress,
      
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    );
  }
}
