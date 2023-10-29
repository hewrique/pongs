import 'package:flutter/material.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/views/login/login_view.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final NavigatorCustomService _navigatorCustomService =
      NavigatorCustomService();
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
                    child: Column(children:  [
                      const LogoMarca(
                        espacamentoPaddingTop: 35.0,
                      ),
                      const InputCustomWidget(inputTitle: "Digite seu nome"),
                      const InputCustomWidget(inputTitle: "Digite seu usuário"),
                      const InputCustomWidget(inputTitle: "Digite seu email"),
                      const InputCustomWidget(inputTitle: "Digite sua senha"),
                      ButtonLargeCustomWidget(buttonName: "Cadastrar", onPressed: () => _navigatorCustomService.push(pageName: const LoginView()
                      , context: context),)
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      _navigatorCustomService.push(
                          pageName: const LoginView(), context: context);
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
      ),
    );
  }
}
