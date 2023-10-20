import 'package:flutter/material.dart';

class CriarContaView extends StatefulWidget {
  const CriarContaView({super.key});

  @override
  State<CriarContaView> createState() => _CriarContaViewState();
}

class _CriarContaViewState extends State<CriarContaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFFFB74E),
        ),
      ),
    );
  }
}
