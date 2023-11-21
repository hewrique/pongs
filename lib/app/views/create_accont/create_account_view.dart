import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongs/app/controllers/create_account_controller/create_account_controller.dart';
import 'package:pongs/app/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:pongs/app/cubits/create_account_cubit/create_account_state.dart';
import 'package:pongs/app/cubits/login_cubit/login_cubit.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/services/service_locator/service_locator.dart';
import 'package:pongs/app/views/login/login_view.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/flushbar_widget/flushbar_erro_widget.dart';
import 'package:pongs/app/widgets/flushbar_widget/flushbar_sucess_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String name = '';
  String userName = '';
  String email = '';
  String password = '';

  late final CreateAccountCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<CreateAccountCubit>();
    super.initState();
  }

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
    return BlocProvider<CreateAccountCubit>(
      create: (_) => getIt.get<CreateAccountCubit>(),
      child: Builder(builder: (context) {
        return BlocListener<CreateAccountCubit, CreateAccountState>(
          bloc: _cubit,
          listener: (context, state) {

            if (state is CreateAccountError) {
              FlushbarErroWidget(
                context: context,
                title: state.title,
                message: state.message,
              );

              Future.delayed(const Duration(seconds: 4), () {
                NavigatorCustomService.pushAndRemoveUntilFadeTransition(
                  pageName: const LoginView(),
                );
              });
            }

            if (state is CreateAccountSucess) {
              NavigatorCustomService.showLoading();

              FlushbarSuccessWidget(
                context: context,
                title: state.title,
                message: state.message,
              );

              Future.delayed(const Duration(seconds: 4), () {
                NavigatorCustomService.pushAndRemoveUntilFadeTransition(
                  pageName: const LoginView(),
                );
              });
            }
          },
          child: Scaffold(
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
                              onPressed: () {
                                _cubit.signUp(
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
          ),
        );
      }),
    );
  }
}
