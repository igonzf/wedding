import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Container(
            height: screenHeight,
            child: Stack(children: <Widget>[
              Image.asset(
                'assets/nombrebackground2.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      'NOS CASAMOS',
                      style: GoogleFonts.cinzel(
                          fontSize: screenHeight * 0.03,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w500,
                          height: screenHeight * 0.003),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Bárbara',
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.12,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'y',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: screenHeight * 0.12,
                        fontWeight: FontWeight.w400,
                        //height: screenHeight * 0.001
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Santi',
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.12,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '22 DE JUNIO DE 2024',
                      style: GoogleFonts.cinzel(
                          fontSize: screenHeight * 0.03,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w500,
                          height: screenHeight * 0.003),
                      maxLines: 1,
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
