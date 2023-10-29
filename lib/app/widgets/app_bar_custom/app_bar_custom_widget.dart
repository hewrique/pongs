import 'package:flutter/material.dart';

class AppBarCustomWidget extends PreferredSize {
  const AppBarCustomWidget(
      {super.key, required super.preferredSize, required super.child});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
          height: 110,
          decoration: const ShapeDecoration(
            color: Color(0xFFFFB74E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
          ),
          child: child),
    );
  }
}
