import 'package:flutter/material.dart';

class Utils {
  static Future showPopup(
    Widget popup,
    BuildContext context, {
    bool dismissOnOutTap = true,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: dismissOnOutTap,
      builder: (BuildContext context) {
        return popup;
      },
    );
  }
}
