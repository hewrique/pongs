import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoMarca extends StatelessWidget {
  const LogoMarca({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56.0),
      child: SizedBox(
        width: 167,
        height: 231,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 0,
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/logo/pongs_logo.png"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
                left: 0,
                top: 150,
                child: SizedBox(
                  width: 167,
                  height: 81,
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        "Pongs!",
                        style: GoogleFonts.getFont("Lobster",
                            color: Colors.black,
                            fontSize: 64,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      top: 66,
                      child: Text(
                        "drinking games",
                        style: GoogleFonts.getFont("Roboto",
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
