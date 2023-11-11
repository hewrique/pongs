import 'package:flutter/material.dart';

class CardHomeWidget extends StatelessWidget {
  final VoidCallback onClick;

  const CardHomeWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                          child:
                              Image.asset('assets/img/game_icons/BeerPong.png'),
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
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 16),
                  child: Text(
                    'Beer Pong',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF161616),
                        fontFamily: 'Poppins'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 16, bottom: 18),
                  child: Text(
                    'Para jogar Beer Pong, coloque uma mesa nivelada, organize copos em formação triangular na borda e encha-os com cerveja até um terço cheios.',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
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
