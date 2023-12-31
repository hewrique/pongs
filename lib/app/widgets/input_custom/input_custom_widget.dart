import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputCustomWidget extends StatelessWidget {
  final String? inputTitle;
  final bool obscureText;
  final bool onlyTwoDigits;
  final TextEditingController? controller;
  final VoidCallback? onClick;
  final Function(String?)? onChanged;
  final FocusNode? focusNode;
  final int customMaxLines;
  final double customWidth;
  final double customHeight;
  final double customBorderRadius;
  final Color customBackgroundColor;
  final double paddingTop;
  const InputCustomWidget({
    super.key,
    this.inputTitle,
    this.obscureText = false,
    this.onlyTwoDigits = false,
    this.controller,
    this.onClick,
    this.onChanged,
    this.focusNode,
    this.customMaxLines = 1,
    this.customWidth = 350.0,
    this.customHeight = 50,
    this.customBorderRadius = 20,
    this.paddingTop = 16.0,
    this.customBackgroundColor = const Color(0xFFFFCE86),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: inputTitle != null
                    ? Text(
                        "$inputTitle",
                        style: GoogleFonts.getFont("Poppins",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    : const SizedBox.shrink()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            width: customWidth,
            height: customHeight,
            decoration: ShapeDecoration(
              color: customBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(customBorderRadius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                focusNode: focusNode,
                autofocus: false,
                maxLines: customMaxLines,
                obscureText: obscureText,
                style: GoogleFonts.getFont(
                  "Poppins",
                  color: Color(0xFF611313),
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        )
      ],
    );
  }
}
