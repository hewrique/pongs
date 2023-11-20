import 'package:flutter/material.dart';
import 'package:pongs/app/widgets/loading_icon/loading_icon.dart';

class LoadingOpacityWidget extends StatelessWidget {
  const LoadingOpacityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFffffff).withOpacity(0.8),
        body: const LoadingIcon());
  }
}
