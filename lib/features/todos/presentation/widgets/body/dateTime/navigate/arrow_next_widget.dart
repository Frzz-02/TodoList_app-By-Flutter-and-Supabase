import 'package:flutter/material.dart';

class ArrowNextWidget extends StatefulWidget {
  final VoidCallback onPress;
  const ArrowNextWidget({super.key, required this.onPress});

  @override
  State<ArrowNextWidget> createState() => _ArrowNextWidgetState();
}

class _ArrowNextWidgetState extends State<ArrowNextWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      
      onPressed: widget.onPress,
      
      icon: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
    );
  }
}
