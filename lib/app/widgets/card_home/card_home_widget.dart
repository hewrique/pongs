import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHomeWidget extends StatelessWidget {
  final String thumbnail;
  final String gameTitle;
  final String description;
  final VoidCallback onClick;

  const CardHomeWidget({
    Key? key,
    required this.thumbnail,
    required this.gameTitle,
    required this.description,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFFFCE86),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Card(
            color: const Color(0xFFFFCE86),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 18),
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.network(thumbnail),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.favorite_outline,
                          size: 30,
                          color: Color(0xFF611313),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 16),
                  child: Text(
                    gameTitle,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF161616),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 16, bottom: 18),
                  child: Text(
                    description,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
