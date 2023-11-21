import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 200,
              child: Image.asset("assets/img/logo/game_favorite.png")),
          Text("Você não possui \nJogos favoritos.",
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF611313)
              ))
        ],
      ),
    );
  }
}
