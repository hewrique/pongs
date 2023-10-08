import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputCustom extends StatelessWidget {
  final String inputTitle;
  final bool password;
  const InputCustom(
      {super.key, required this.inputTitle, this.password = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                inputTitle,
                style: GoogleFonts.getFont("Poppins",
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            width: 350,
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
