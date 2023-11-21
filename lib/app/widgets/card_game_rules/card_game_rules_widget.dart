import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardGameRulesWidget extends StatelessWidget {
  final List<String> howToPlay;
  const CardGameRulesWidget({
    Key? key,
    required this.howToPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Como jogar?',
          style: GoogleFonts.getFont(
            'Poppins',
            color: Color(0xFF161616),
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: howToPlay.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      howToPlay[index],
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
