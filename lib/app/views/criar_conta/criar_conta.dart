import 'package:flutter/material.dart';
import 'package:pongs/app/views/login/login_view.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Column(children: const [
                    LogoMarca(
                      espacamentoPaddingTop: 35.0,
                    ),
                    InputCustom(inputTitle: "Digite seu nome"),
                    InputCustom(inputTitle: "Digite seu usuário"),
                    InputCustom(inputTitle: "Digite seu email"),
                    InputCustom(inputTitle: "Digite sua senha"),
                    ButtonLargeCustom(buttonName: "Cadastrar")
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const LoginView(),
                      ),
                    );
                  },
                  child: const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Já tem conta? ",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                      text: "Faça Login",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ])),
                ),
              ],
            ),
          )),
    );
  }
}
