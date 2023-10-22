import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:developer';

import 'package:invitacion/timeLeft.dart';
import 'package:invitacion/form.dart';
import 'package:invitacion/place.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key, required this.title});
  final String title;

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  bool isClicked = true;
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
                'assets/background.jpg',
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
                      style: GoogleFonts.greatVibes(
                          fontSize: screenHeight * 0.10,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'y',
                      style: GoogleFonts.greatVibes(
                        fontSize: screenHeight * 0.10,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Santi',
                      style: GoogleFonts.greatVibes(
                          fontSize: screenHeight * 0.10,
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
                height: screenHeight * 0.3,
                width: screenWidth,
                color: const Color(0xff9ab4ac),
                child: Center(
                    child: Row(
                  children: [
                    Text(
                      'O amor é como o vento, non se ve, pero sérvese para guiar o barco da vida. ❤️',
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: screenHeight * 0.6,
                width: screenWidth,
                child: Stack(children: <Widget>[
                  Image.asset(
                    'assets/cuenta2.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Center(
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
                ])),
          ),
          SliverToBoxAdapter(
              child: Container(
            width: screenWidth,
            child: Column(
              children: [
                Text('Dónde y Cuándo'),
                MyCustomPlace(
                  event: "Preboda",
                  namePlace: "Casa de la novia",
                  hour: "19:00h",
                  location: "Grulleros",
                  image: "assets/Preboda.jpg",
                  coord: [2.0, 5.65],
                ),
                MyCustomPlace(
                  event: "Ceremonia Religiosa",
                  namePlace: "Catedral de Léon",
                  hour: "13:00h",
                  location: "Calle Ancha",
                  image: "assets/catedral.jpeg",
                  coord: [2.0, 5.65],
                ),
                MyCustomPlace(
                  event: "Celebración",
                  namePlace: "El Cigarral",
                  hour: "14:45h",
                  location: "Cembranos",
                  image: "assets/cigarral.jpg",
                  coord: [2.0, 5.65],
                )
              ],
            ),
          )),
          SliverToBoxAdapter(
              child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth,
                  child: Center(
                      child: SizedBox(
                          width: screenHeight * 0.8,
                          height: double.infinity,
                          child: ElevatedButton(
                            child: Text("CONFIRMAR ASISTENCIA"),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffBE9E49),
                              elevation: 0,
                            ),
                            onPressed: () {
                              isClicked = !isClicked;
                            },
                          ))))),
          SliverToBoxAdapter(
              child: isClicked
                  ? Container(
                      child: Center(
                          child: Column(children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      MyCustomForm()
                    ])))
                  : Container())
        ],
      ),
    );
  }
}
