import 'package:flutter/material.dart';

import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/views/login/login_view.dart';
import 'package:pongs/app/widgets/loading_animation/loading_animation_widget.dart';
import 'package:pongs/app/widgets/logo/logo_marca_widget.dart';

class SplashScreenView extends StatefulWidget {
  final BuildContext context;
  const SplashScreenView({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
 
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      NavigatorCustomService.push(
        pageName: const LoginView(),
        context: context,
      );
    });
    super.initState();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LogoMarca(espacamentoPaddingTop: 10),
            LoadingAnimationWidgetCustom(
              leftDotColor: Color(0xFFFFC928),
              rightDotColor: Color(0xFFFFC928),
              leftBorderDotColor: Color(0xFF000000),
              rightBorderDotColor: Color(0xFF000000),
              borderWidth: 3,
              borderStyle: BorderStyle.solid,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
