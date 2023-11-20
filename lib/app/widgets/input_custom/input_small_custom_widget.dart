import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputSmallCustomWidget extends StatelessWidget {
  final String? inputTitle;
  final bool obscureText;
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
  const InputSmallCustomWidget({
    super.key,
    this.inputTitle,
    this.obscureText = false,
    this.controller,
    this.onClick,
    this.onChanged,
    this.focusNode,
    this.customMaxLines = 1,
    this.customWidth = 70,
    this.customHeight = 50,
    this.customBorderRadius = 15,
    this.paddingTop = 0.0,
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
                textAlign: TextAlign.center,
                controller: controller,
                onChanged: onChanged,
                focusNode: focusNode,
                autofocus: false,
                maxLines: customMaxLines,
                obscureText: obscureText,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                style: const TextStyle(
                  fontFamily: "Poppins",
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
