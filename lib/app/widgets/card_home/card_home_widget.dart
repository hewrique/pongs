import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardHomeWidget extends StatelessWidget {
  const CardHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            width: 346,
            height: 210,
            decoration: ShapeDecoration(
                color: const Color(0xFFFFCE86),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
      )
    ]);
  }
}
