import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongs/app/icons/icons_pongs.dart';

class FlushbarErroWidget {
  final String title;
  final String message;
  final Duration? duration;
  final Icon? icon;
  final Color? backgroundColor;
  final BuildContext context;
  final OnTap? onTap;

  FlushbarErroWidget({
    required this.context,
    required this.title,
    required this.message,
    this.duration,
    this.icon,
    this.backgroundColor,
    this.onTap,
  }) {
    Flushbar(
      titleText: Text(
        title,
        style: GoogleFonts.getFont(
          'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.getFont(
          'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      messageColor: Colors.white,
      duration: duration ?? Duration(seconds: 5),
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.all(6.0),
      padding: EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(10),
      backgroundColor: backgroundColor ?? const Color(0xFF611313),
      icon: icon ??
          Icon(
            IconsPongs.close,
            color: Colors.white,
          ),
      onTap: onTap,
    )..show(context);
  }
}
