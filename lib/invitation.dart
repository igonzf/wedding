import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:developer';

import 'package:invitacion/timeLeft.dart';
import 'package:invitacion/form.dart';
import 'package:invitacion/place.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key, required this.title});
  final String title;

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  bool isClicked = false;
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
                color: const Color(0xff9ab4ac),
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: Column(
                      children: [
                        Spacer(),
                        Text(
                          'O amor é como o vento, non se ve, pero sérvese para guiar o barco da vida.',
                          style: GoogleFonts.cormorantGaramond(
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.white,
                          size: 15,
                        ),
                        Spacer()
                      ],
                    )))),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: screenHeight * 0.6,
                width: screenWidth,
                child: Stack(children: <Widget>[
                  Image.asset(
                    'assets/cuenta3.jpg',
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
                SizedBox(height: screenHeight * 0.05),
                Text('Dónde y Cuándo',
                    style: GoogleFonts.cormorantGaramond(
                        fontSize: screenHeight * 0.05,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center),
                SizedBox(height: screenHeight * 0.05),
                MyCustomPlace(
                  event: "Preboda",
                  namePlace: "Casa de la novia",
                  hour: "19:00h",
                  location: "Grulleros",
                  image: "assets/Preboda.jpg",
                  url:
                      'https://www.google.com/maps/place/C.+Real,+Grulleros,+Le%C3%B3n/@42.4987298,-5.5494287,17z/data=!3m1!4b1!4m6!3m5!1s0xd3788c417653c31:0xe0be641003e41dc5!8m2!3d42.4987298!4d-5.5468538!16s%2Fg%2F1v2jf5yl?entry=ttu',
                ),
                SizedBox(height: screenHeight * 0.02),
                MyCustomPlace(
                  event: "Ceremonia Religiosa",
                  namePlace: "Catedral de Léon",
                  hour: "13:00h",
                  location: "Calle Ancha",
                  image: "assets/catedral.jpeg",
                  url:
                      'https://www.google.com/maps/place/Catedral+de+Le%C3%B3n/@42.5994383,-5.5671632,15z/data=!4m6!3m5!1s0xd379a9b863a0fab:0x13727554f4d5e06a!8m2!3d42.5994383!4d-5.5671632!16zL20vMDc3MF9z?entry=ttu',
                ),
                SizedBox(height: screenHeight * 0.02),
                MyCustomPlace(
                  event: "Celebración",
                  namePlace: "El Cigarral",
                  hour: "14:45h",
                  location: "Cembranos",
                  image: "assets/cigarral.jpg",
                  url:
                      'https://www.google.com/maps/place/El+Cigarral+de+Cembranos/@42.4797123,-5.5945828,17z/data=!3m1!4b1!4m6!3m5!1s0xd3786aa8c869f47:0x691a14437d182704!8m2!3d42.4797124!4d-5.5897119!16s%2Fg%2F1z44b28v9?entry=ttu',
                )
              ],
            ),
          )),
          //timeline
          SliverToBoxAdapter(
              child: Container(
                  width: screenWidth,
                  child: Center(
                      child: Column(children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                          'Te compartimos los detalles de la celebración',
                          style: GoogleFonts.cormorantGaramond(
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                        ),
                        Column(
                          children: [
                            Icon(
                              CupertinoIcons.heart_circle_fill,
                              color: Colors.black,
                              size: screenHeight * 0.06,
                            ),
                          ],
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '19:00h',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Preboda',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.04,
                                  fontWeight: FontWeight.w400),
                            ),
                            Image.asset(
                              'assets/cocktailicon.png',
                              width: screenWidth * 0.2,
                              fit: BoxFit.cover,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                        ),
                        Icon(
                          CupertinoIcons.heart_circle_fill,
                          color: Colors.black,
                          size: screenHeight * 0.06,
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '13:00h',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Ceremonia',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.04,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Religiosa',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.04,
                                  fontWeight: FontWeight.w400),
                            ),
                            Image.asset(
                              'assets/iglesiaicon.png',
                              width: screenWidth * 0.2,
                              fit: BoxFit.cover,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                        ),
                        Icon(
                          CupertinoIcons.heart_circle_fill,
                          color: Colors.black,
                          size: screenHeight * 0.06,
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '14:45h',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Celebración',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.04,
                                  fontWeight: FontWeight.w400),
                            ),
                            Image.asset(
                              'assets/restauranteicon.png',
                              width: screenWidth * 0.2,
                              fit: BoxFit.cover,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                        ),
                        Icon(
                          CupertinoIcons.heart_circle_fill,
                          color: Colors.black,
                          size: screenHeight * 0.06,
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '22:00h',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Fiesta',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.04,
                                  fontWeight: FontWeight.w400),
                            ),
                            Image.asset(
                              'assets/fiestaicon.png',
                              width: screenWidth * 0.2,
                              fit: BoxFit.cover,
                            )
                          ],
                        )
                      ],
                    )
                  ])))),
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
