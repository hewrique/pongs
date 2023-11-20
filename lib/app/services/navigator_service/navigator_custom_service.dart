import 'package:flutter/material.dart';
import 'package:pongs/app/services/navigator_service/navigator_services.dart';
import 'package:pongs/app/widgets/loading_opacity/loading_opacity_widget.dart';

class NavigatorCustomService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> push({required Widget pageName}) async {
    await NavigatorServices.key.currentState!.push(
      MaterialPageRoute(
        builder: (_) => pageName,
      ),
    );
  }

  static Future<void> pushAndRemoveUntil({required Widget pageName}) async {
    await NavigatorServices.key.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => pageName),
      (route) => false,
    );
  }

  static Future<void> pushSlideTransitionLeft(
      {required Widget pageName}) async {
    await NavigatorServices.key.currentState!.push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => pageName,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, widget) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: widget),
      ),
    );
  }

  static Future<void> pushAndRemoveUntilSlideTransitionLeft(
      {required Widget pageName}) async {
    await NavigatorServices.key.currentState!.pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => pageName,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, widget) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: widget),
      ),
      (route) => false,
    );
  }

  static Future<void> pushFadeTransition({required Widget pageName}) async {
    await NavigatorServices.key.currentState!.push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return pageName;
        },
        transitionsBuilder:
            (_, Animation<double> animation, __, Widget widget) {
          return FadeTransition(
            opacity: animation,
            child: widget,
          );
        },
      ),
    );
  }

  static Future<void> pushAndRemoveUntilFadeTransition(
      {required Widget pageName}) async {
    await NavigatorServices.key.currentState!.pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return pageName;
        },
        transitionsBuilder:
            (_, Animation<double> animation, __, Widget widget) {
          return FadeTransition(
            opacity: animation,
            child: widget,
          );
        },
      ),
      (route) => false,
    );
  }

  static Future<void> showLoading() async {
    await NavigatorServices.key.currentState!.push(
      MaterialPageRoute(
        builder: (_) => const LoadingOpacityWidget(),
      ),
    );
  }
}
