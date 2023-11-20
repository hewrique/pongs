import 'package:flutter/material.dart';
import 'package:pongs/app/controllers/create_account_controller/create_account_controller.dart';
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
  final CreateAccountController _createAccountController =
      CreateAccountController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String name = '';
  String userName = '';
  String email = '';
  String password = '';

  @override
  void dispose() {
  _nameController.dispose();
  _userNameController.dispose();
  _emailController.dispose();
  _passwordController.dispose();
    super.dispose();
  }

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
                      espacamentoPaddingTop: 35.0,
                    ),
                    InputCustomWidget(
                      inputTitle: "Digite seu nome",
                      controller: _nameController,
                      onChanged: (value) {
                        name = value ?? '';
                      },
                    ),
                    InputCustomWidget(
                      inputTitle: "Digite seu usuário",
                      controller: _userNameController,
                      onChanged: (value) {
                        userName = value ?? '';
                      },
                    ),
                    InputCustomWidget(
                      inputTitle: "Digite seu email",
                      controller: _emailController,
                      onChanged: (value) {
                        email = value ?? '';
                      },
                    ),
                    InputCustomWidget(
                      inputTitle: "Digite sua senha",
                      controller: _passwordController,
                      onChanged: (value) {
                        password = value ?? '';
                      },
                    ),
                    ButtonLargeCustomWidget(
                        buttonName: "Cadastrar",
                        // onPressed: () => NavigatorCustomService.push(
                        //   pageName: const LoginView(),
                        // ),
                        onPressed: () {
                          NavigatorCustomService.showLoading();
                          
                          _createAccountController.signUp(
                              email: email,
                              password: password,
                              name: name,
                              userName: userName,
                            );
                        })
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    NavigatorCustomService.push(
                      pageName: const LoginView(),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Já tem conta? ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
