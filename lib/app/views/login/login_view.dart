import 'package:flutter/material.dart';
import 'package:pongs/app/controllers/login_controller/login_controller.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/views/create_accont/create_account_view.dart';
import 'package:pongs/app/views/recovery_code/recovery_code.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = LoginController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';

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
                      InputCustomWidget(
                        inputTitle: "E-mail",
                        controller: _emailController,
                        onChanged: (value) {
                          email = value ?? '';
                        },
                      ),
                      InputCustomWidget(
                        inputTitle: "Senha",
                        obscureText: true,
                        controller: _passwordController,
                        onChanged: (value) {
                          password = value ?? '';
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0, top: 5.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => NavigatorCustomService.push(
                              pageName: const RecoveryCodeView(),
                            ),
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
                      ButtonLargeCustomWidget(
                        buttonName: "Entrar",
                        onPressed: () {
                          loginController.signIn(
                            email: email,
                            password: password,
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () => NavigatorCustomService.push(
                          pageName: const CreateAccountView(),
                        ),
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
