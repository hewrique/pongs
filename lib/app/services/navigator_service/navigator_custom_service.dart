import 'package:flutter/material.dart';

class NavigatorCustomService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

 static Future<void> push(
      {required Widget pageName, required BuildContext context}) async{
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => pageName,
      ),
    );
  }

  static Future<void> pushAndRemoveUntil({required Widget pageName, required BuildContext context}) async{
    await Navigator.pushAndRemoveUntil(
       context,
        MaterialPageRoute(
          builder: (BuildContext context) => pageName,
        ),
        (route) => false);
  }
}
