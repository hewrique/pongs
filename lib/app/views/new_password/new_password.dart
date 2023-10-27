import 'package:flutter/material.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFB74E),
                ),
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(
                      child: Column(children: [
                    const LogoMarca(),
                  ]))
                ])))));
  }
}
