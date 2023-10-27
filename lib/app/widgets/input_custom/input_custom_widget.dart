import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputCustom extends StatelessWidget {
  final String? inputTitle;
  final bool password;
  final double customWidth;
  final double paddingTop;
  const InputCustom(
      {super.key,
      this.inputTitle,
      this.password = false,
      this.customWidth = 350.0,
      this.paddingTop = 16.0});

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
            height: 50,
            decoration: ShapeDecoration(
                color: const Color(0xFFFFCE86),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
              child: TextFormField(
                autofocus: false,
                maxLines: 1,
                obscureText: password,
                style: const TextStyle(
                    fontFamily: "Poppins", color: Color(0xFF611313)),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        )
      ],
    );
  }
}
