import 'package:flutter/material.dart';
import 'package:pongs/app/icons/icons_pongs.dart';

class CardGameDescriptionWidget extends StatelessWidget {
  final String thumbnail;
  final String gameTitle;
  final String materials;
  final String description;
  final int amountOfPeople;
  final int timePerRound;

  const CardGameDescriptionWidget({
    super.key,
    required this.thumbnail,
    required this.gameTitle,
    required this.materials,
    required this.description,
    required this.amountOfPeople,
    required this.timePerRound,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Image.network(thumbnail),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            gameTitle,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF161616),
                fontFamily: 'Poppins'),
          ),
        ),
        const SizedBox(height: 28),
        Row(
          children: [
            const Icon(
              IconsPongs.users_multiple,
              size: 19,
              color: Color(0xFF611313),
            ),
            const SizedBox(width: 20),
            Text(
             ' $amountOfPeople pessoas por rodada',
              style: const TextStyle(
                color: Color(0xFF611313),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            const Icon(
              IconsPongs.clock,
              size: 24,
              color: Color(0xFF611313),
            ),
            const SizedBox(width: 15),
            Text(
              '$timePerRound minutos a ${timePerRound+1} minutos',
              style: const TextStyle(
                color: Color(0xFF611313),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            const Icon(
              IconsPongs.choop,
              size: 24,
              color: Color(0xFF611313),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                materials,
                style: const TextStyle(
                  color: Color(0xFF611313),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(
          thickness: 2.5,
          color: Color(0xFF611313),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: const TextStyle(
              fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
