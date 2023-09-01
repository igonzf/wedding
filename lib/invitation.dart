import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:invitacion/timeLeft.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key, required this.title});
  final String title;

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  List<int> _timeUntil = List<int>.filled(4, 0);

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeUntil = TimeLeft().timeLeft(DateTime(2024, 6, 22, 14, 00));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50.0,
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
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      '22 DE JUNIO DE 2024',
                      style: GoogleFonts.cinzel(
                          fontSize: screenHeight * 0.03,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ])),
            ]),
          )),
          SliverToBoxAdapter(
            child: Container(
              height: screenHeight * 0.6,
              width: screenWidth,
              child: Center(
                  child: Column(
                children: [
                  Spacer(),
                  Text('Faltan',
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.05,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center),
                  Row(
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          Text(_timeUntil[0].toString(),
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.07,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                          SizedBox(
                            child: Text("Días",
                                style: GoogleFonts.cormorantGaramond(
                                    fontSize: screenHeight * 0.025,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center),
                            width: screenWidth * 0.22,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(_timeUntil[1].toString(),
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.07,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                          SizedBox(
                            child: Text("Horas",
                                style: GoogleFonts.cormorantGaramond(
                                    fontSize: screenHeight * 0.025,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center),
                            width: screenWidth * 0.22,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(_timeUntil[2].toString(),
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.07,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                          SizedBox(
                            child: Text("Minutos",
                                style: GoogleFonts.cormorantGaramond(
                                    fontSize: screenHeight * 0.025,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center),
                            width: screenWidth * 0.22,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(_timeUntil[3].toString(),
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.07,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                          SizedBox(
                            child: Text("Segundos",
                                style: GoogleFonts.cormorantGaramond(
                                    fontSize: screenHeight * 0.025,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center),
                            width: screenWidth * 0.22,
                          )
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('para nuestra boda',
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.05,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center),
                  Spacer()
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
