 
import 'package:flutter/material.dart';
import 'package:pongs/app/icons/pongs_icons.dart';

class ButtonsGamePreviewWidget extends StatelessWidget {
  const ButtonsGamePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.transparent,
            child: const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                right: 20,
                bottom: 10,
              ),
              child: Icon(
                IconsPongs.arrow_left,
                size: 19,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: const Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 5.0,
              right: 5.0,
              bottom: 10,
            ),
            child: Icon(IconsPongs.heart_outline),
          ),
        ),
      ],
    );
  }
}
