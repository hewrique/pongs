import 'package:flutter/material.dart';
import 'package:pongs/app/views/criar_conta/criar_conta.dart';
import 'package:pongs/app/views/esqueceu_senha/esqueceu_senha.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFFFFB74E)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      const LogoMarca(),
                      const InputCustom(inputTitle: "E-mail"),
                      const InputCustom(
                        inputTitle: "Senha",
                        password: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0, top: 5.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const EsqueceuSenha(),
                                ),
                              );
                            },
                            child: const Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 11,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ),
                      const ButtonLargeCustom(
                        buttonName: "Entrar",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CriarContaView(),
                            ),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Não tem conta? ",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: "Crie sua conta",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
