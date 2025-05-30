import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class ToastWidget extends StatefulWidget {
  final String message;
  const ToastWidget({super.key, required this.message});

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  @override
  Widget build(BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback((_){
              MotionToast(
                  width: 400,
                  height: 70,
                  secondaryColor: const Color.fromARGB(255, 120, 255, 194),
                  primaryColor: const Color(0xFF5CB338),
                  icon: Icons.check_circle_outline,
                  contentPadding: const EdgeInsets.only(left: 10),
                  animationType: AnimationType.slideInFromBottom,
                  toastAlignment: Alignment.bottomRight,
                  iconSize: 35,
                  toastDuration: const Duration(seconds: 3),
                  title: const Text('Successful', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  description: Text(widget.message, style: const TextStyle(color: Colors.white),),
                  // barrierColor: const Color.fromARGB(255, 255, 0, 0),
                  displaySideBar: true,
                ).show(context);
        });

        return const SizedBox();
  }
}
