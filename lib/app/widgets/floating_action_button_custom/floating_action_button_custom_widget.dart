import 'package:flutter/material.dart';
import 'package:pongs/app/icons/pongs_icons.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const FloatingActionButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF611313),
          onPressed: onPressed,
          child: const Icon(
            IconsPongs.gamepad,
            size: 35.50,
            color: Color(0xFFFFB74E),
          ),
        ),
      );
  }
}