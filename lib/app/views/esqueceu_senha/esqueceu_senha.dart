import 'package:flutter/material.dart';
import 'package:pongs/app/views/login/login_view.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
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
            child: Column(
          children: [
            SizedBox(
                child: Column(children: [
              const LogoMarca(
                espacamentoPaddingTop: 64.0,
              ),
              const Text(
                "Enviamos um código para seu e-mail cadastrado",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: ("Poppins"),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InputCustomWidget(
                    customWidth: 75.5,
                    paddingTop: 2.0,
                  ),
                  InputCustomWidget(
                    customWidth: 75.5,
                    paddingTop: 2.0,
                  ),
                  InputCustomWidget(
                    customWidth: 75.5,
                    paddingTop: 2.0,
                  ),
                  InputCustomWidget(
                    customWidth: 75.5,
                    paddingTop: 2.0,
                  ),
                ],
              ),
              const ButtonLargeCustomWidget(
                buttonName: "Enviar",
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginView(),
                    ),
                  );
                },
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Lembrou a senha? ",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: "Faça login",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ]),
                ),
              ),
            ])),
          ],
        )),
      ),
    ));
  }
}
