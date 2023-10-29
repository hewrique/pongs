import 'package:flutter/material.dart';

class NavigatorCustomService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> push({required Widget pageName, required BuildContext context}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => pageName,
      ),
    );
  }

  Future<dynamic> pushAndRemoveUntil({required Widget pageName}) {
    return Navigator.pushAndRemoveUntil(
        navigatorKey.currentState!.context,
        MaterialPageRoute(
          builder: (BuildContext context) => pageName,
        ),
        (route) => false);
  }
}
