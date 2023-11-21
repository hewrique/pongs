import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongs/app/cubits/login_cubit/login_cubit.dart';
import 'package:pongs/app/cubits/login_cubit/login_state.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/services/service_locator/service_locator.dart';
import 'package:pongs/app/views/create_accont/create_account_view.dart';
import 'package:pongs/app/views/dashboard/dashboard_view.dart';
import 'package:pongs/app/views/recovery_code/recovery_code.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/flushbar_widget/flushbar_erro_widget.dart';
import 'package:pongs/app/widgets/flushbar_widget/flushbar_sucess_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginCubit _cubit;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';

  @override
  void initState() {
    _cubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => getIt.get<LoginCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<LoginCubit, LoginState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is LoginSucess) {
              NavigatorCustomService.pushAndRemoveUntil(
                pageName: const DashboardView(),
              );
            }

            if (state is LoginError) {
              FlushbarErroWidget(
                context: context,
                title: state.title,
                message: state.message,
              );
            }
          },
          child: Scaffold(
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
                              padding:
                                  const EdgeInsets.only(right: 35.0, top: 5.0),
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
                                _cubit.signIn(
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
          ),
        );
      }),
    );
  }
}
