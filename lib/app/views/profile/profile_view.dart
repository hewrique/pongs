import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 260, child: Image.asset("assets/img/logo/new_user.png")),
          Text("Você não possui \nusuários cadastrados.",
          textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF611313),
              ))
        ],
      ),
    );
  }
}
