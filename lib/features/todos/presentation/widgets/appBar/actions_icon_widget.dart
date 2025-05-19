import 'package:flutter/material.dart';

class ActionsIconWidget extends StatefulWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback onhover;
  
  const ActionsIconWidget({super.key, required this.tooltip, required this.icon, this.onPressed = _defaultOnPressed, this.onhover = _defaultOnHover});
  static void _defaultOnPressed(){}
  static void _defaultOnHover(){}

  @override
  State<ActionsIconWidget> createState() => _ActionsIconWidgetState();
}




class _ActionsIconWidgetState extends State<ActionsIconWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(

              tooltip: widget.tooltip,
              hoverColor: const Color.fromARGB(39, 255, 255, 255),
              
              icon: Icon(
                widget.icon,
                color: Colors.white,
              ),


              onPressed: widget.onPressed,
              onHover: (value) => widget.onhover,


                        
    );
  }
}
