import 'package:flutter/material.dart';
import 'package:pongs/app/icons/pongs_icons.dart';

class CardGameDescriptionWidget extends StatelessWidget {
  const CardGameDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Image.asset('assets/img/game_icons/BeerPong.png'),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Beer Pong',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF161616),
                fontFamily: 'Poppins'),
          ),
        ),
        const SizedBox(height: 28),
        const Row(
          children: [
            Icon(
              IconsPongs.users_multiple,
              size: 19,
              color: Color(0xFF611313),
            ),
            SizedBox(width: 20),
            Text(
              '2 pessoas por rodada',
              style: TextStyle(
                color: Color(0xFF611313),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const Row(
          children: [
            Icon(
              IconsPongs.clock,
              size: 24,
              color: Color(0xFF611313),
            ),
            SizedBox(width: 15),
            Text(
              '15 a 20 minutos',
              style: TextStyle(
                color: Color(0xFF611313),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const Row(
          children: [
            Icon(
              IconsPongs.choop,
              size: 24,
              color: Color(0xFF611313),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                '1 mesa, 6-10 copos, 1 bola de ping-pong e uma bebida de sua preferência',
                style: TextStyle(
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
        const Text(
          'Para jogar Beer Pong, coloque uma mesa nivelada, organize copos em formação triangular na borda e encha-os com cerveja até um terço cheios.',
          style: TextStyle(
              fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
