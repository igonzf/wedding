import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
            height: 800.0,
            child: Stack(children: <Widget>[
              Image.asset(
                'assets/nombrebackground.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Center(
                  child: Column(children: [
                Text(
                  'NOS CASAMOS',
                  style: GoogleFonts.cinzel(
                      fontSize: 35,
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.w500,
                      height: 5.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Bárbara',
                  style: GoogleFonts.cormorantGaramond(
                      fontSize: 100, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'y',
                  style: GoogleFonts.cormorantGaramond(
                      fontSize: 100, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Santi',
                  style: GoogleFonts.cormorantGaramond(
                      fontSize: 100, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '22 DE JUNIO DE 2024',
                  style: GoogleFonts.cinzel(
                      fontSize: 35,
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.w500,
                      height: 3.0),
                  textAlign: TextAlign.center,
                ),
              ])),
            ]),
          ))
        ],
      ),
    );
  }
}
