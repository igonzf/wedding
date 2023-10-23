import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:invitacion/timeLeft.dart';
import 'package:invitacion/form.dart';
import 'package:invitacion/place.dart';
import 'package:timeline_tile/timeline_tile.dart';
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
  int index = 0;
  Timer? _timer;
  final scrollController = ScrollController();
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  final key4 = GlobalKey();
  Offset position1 = Offset(0.0, 0.0);
  Offset position2 = Offset(0.0, 0.0);
  Offset position3 = Offset(0.0, 0.0);
  Offset position4 = Offset(0.0, 0.0);

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeUntil = TimeLeft().timeLeft(DateTime(2024, 6, 22, 14, 00));
      });
    });
  }

  void onListen() {
    print('scrollController: ${scrollController.offset}');
    RenderBox box1 = key1.currentContext?.findRenderObject() as RenderBox;
    RenderBox box2 = key2.currentContext?.findRenderObject() as RenderBox;
    RenderBox box3 = key3.currentContext?.findRenderObject() as RenderBox;
    RenderBox box4 = key4.currentContext?.findRenderObject() as RenderBox;
    position1 = box1.localToGlobal(Offset.zero);
    position2 = box2.localToGlobal(Offset.zero);
    position3 = box3.localToGlobal(Offset.zero);
    position4 = box4.localToGlobal(Offset.zero);
    print('p1: ${position1.dy}');
    print('p2: ${position2.dy}');
    print('p3: ${position3.dy}');
    print('p4: ${position4.dy}');
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
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
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          'O amor é como o vento, non se ve, pero sérvese para guiar o barco da vida.',
                          style: GoogleFonts.cormorantGaramond(
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        const Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.white,
                          size: 15,
                        ),
                        const Spacer()
                      ],
                    )))),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
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
                      const Spacer(),
                      Text('Faltan',
                          style: GoogleFonts.cormorantGaramond(
                              fontSize: screenHeight * 0.05,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                      Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              Text(_timeUntil[0].toString(),
                                  style: GoogleFonts.cormorantGaramond(
                                      fontSize: screenHeight * 0.07,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                width: screenWidth * 0.22,
                                child: Text("Días",
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.025,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center),
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
                                width: screenWidth * 0.22,
                                child: Text("Horas",
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.025,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center),
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
                                width: screenWidth * 0.22,
                                child: Text("Minutos",
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.025,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center),
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
                                width: screenWidth * 0.22,
                                child: Text("Segundos",
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.025,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center),
                              )
                            ],
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text('para nuestra boda',
                          style: GoogleFonts.cormorantGaramond(
                              fontSize: screenHeight * 0.05,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                      const Spacer()
                    ],
                  )),
                ])),
          ),
          //timeline
          SliverToBoxAdapter(
              child: Container(
                  alignment: Alignment.center,
                  width: screenWidth,
                  child: Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            'Te compartimos los detalles de la celebración',
                            style: GoogleFonts.cormorantGaramond(
                                fontSize: screenHeight * 0.03,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ))),
                      TimelineTile(
                        key: key1,
                        axis: TimelineAxis.vertical,
                        indicatorStyle: IndicatorStyle(
                          color: position1.dy >= 150
                              ? Color(0xff69491e)
                              : Colors.black,
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.08,
                          iconStyle: IconStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              iconData: Icons.favorite_border_rounded),
                        ),
                        isFirst: true,
                        afterLineStyle: LineStyle(
                            color: position1.dy < 150
                                ? Colors.black
                                : Color(0xff69491e)),
                        alignment: TimelineAlign.center,
                        startChild: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '19:00h',
                                style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.w400,
                                  color: position1.dy > 150
                                      ? Color(0xff69491e)
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.04,
                              )
                            ]),
                        endChild: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 60, bottom: 10),
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Preboda',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: position1.dy > 150
                                            ? Color(0xff69491e)
                                            : Colors.black),
                                  ),
                                  Image.asset(
                                    'assets/cocktailicon.png',
                                    width: screenWidth * 0.2,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TimelineTile(
                        key: key2,
                        axis: TimelineAxis.vertical,
                        indicatorStyle: IndicatorStyle(
                          color: position2.dy >= 150
                              ? Color(0xff69491e)
                              : Colors.black,
                          height: screenHeight * 0.08,
                          width: screenWidth * 0.08,
                          iconStyle: IconStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              iconData: Icons.favorite_border_rounded),
                        ),
                        beforeLineStyle: LineStyle(
                            color: position2.dy < 200
                                ? Colors.black
                                : Color(0xff69491e)),
                        afterLineStyle: LineStyle(
                            color: position2.dy < 150
                                ? Colors.black
                                : Color(0xff69491e)),
                        alignment: TimelineAlign.center,
                        startChild: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '13:00h',
                                style: GoogleFonts.cormorantGaramond(
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.w400,
                                    color: position2.dy > 150
                                        ? Color(0xff69491e)
                                        : Colors.black),
                              ),
                              SizedBox(
                                width: screenWidth * 0.04,
                              )
                            ]),
                        endChild: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 20),
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ceremonia',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: position2.dy > 150
                                            ? Color(0xff69491e)
                                            : Colors.black),
                                  ),
                                  Text(
                                    'Religiosa',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: position2.dy > 150
                                            ? Color(0xff69491e)
                                            : Colors.black),
                                  ),
                                  Image.asset(
                                    'assets/iglesiaicon.png',
                                    width: screenWidth * 0.2,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TimelineTile(
                        key: key3,
                        axis: TimelineAxis.vertical,
                        indicatorStyle: IndicatorStyle(
                          color: position3.dy >= 150
                              ? Color(0xff69491e)
                              : Colors.black,
                          height: screenHeight * 0.08,
                          width: screenWidth * 0.08,
                          iconStyle: IconStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              iconData: Icons.favorite_border_rounded),
                        ),
                        beforeLineStyle: LineStyle(
                            color: position3.dy < 200
                                ? Colors.black
                                : Color(0xff69491e)),
                        afterLineStyle: LineStyle(
                            color: position3.dy < 150
                                ? Colors.black
                                : Color(0xff69491e)),
                        alignment: TimelineAlign.center,
                        startChild: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '14:45h',
                                style: GoogleFonts.cormorantGaramond(
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.w400,
                                    color: position3.dy > 150
                                        ? Color(0xff69491e)
                                        : Colors.black),
                              ),
                              SizedBox(
                                width: screenWidth * 0.04,
                              )
                            ]),
                        endChild: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 20),
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Celebración',
                                    style: GoogleFonts.cormorantGaramond(
                                      fontSize: screenHeight * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: position3.dy > 150
                                          ? Color(0xff69491e)
                                          : Colors.black,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/restauranteicon.png',
                                    width: screenWidth * 0.2,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TimelineTile(
                        key: key4,
                        axis: TimelineAxis.vertical,
                        indicatorStyle: IndicatorStyle(
                          color: position4.dy >= 150
                              ? Color(0xff69491e)
                              : Colors.black,
                          height: screenHeight * 0.08,
                          width: screenWidth * 0.08,
                          iconStyle: IconStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.05,
                              iconData: Icons.favorite_border_rounded),
                        ),
                        isLast: true,
                        beforeLineStyle: LineStyle(
                            color: position4.dy < 200
                                ? Colors.black
                                : Color(0xff69491e)),
                        alignment: TimelineAlign.center,
                        startChild: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '22:00h',
                                style: GoogleFonts.cormorantGaramond(
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.w400,
                                    color: position4.dy > 150
                                        ? Color(0xff69491e)
                                        : Colors.black),
                              ),
                              SizedBox(
                                width: screenWidth * 0.04,
                              )
                            ]),
                        endChild: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 20),
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fiesta',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: position4.dy > 150
                                            ? Color(0xff69491e)
                                            : Colors.black),
                                  ),
                                  Image.asset(
                                    'assets/fiestaicon.png',
                                    width: screenWidth * 0.2,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )))),
          SliverToBoxAdapter(
              child: SizedBox(
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
                const MyCustomPlace(
                  event: "Preboda",
                  namePlace: "Casa de la novia",
                  hour: "19:00h",
                  location: "Grulleros",
                  image: "assets/Preboda.jpg",
                  url:
                      'https://www.google.com/maps/place/C.+Real,+Grulleros,+Le%C3%B3n/@42.4987298,-5.5494287,17z/data=!3m1!4b1!4m6!3m5!1s0xd3788c417653c31:0xe0be641003e41dc5!8m2!3d42.4987298!4d-5.5468538!16s%2Fg%2F1v2jf5yl?entry=ttu',
                ),
                SizedBox(height: screenHeight * 0.02),
                const MyCustomPlace(
                  event: "Ceremonia Religiosa",
                  namePlace: "Catedral de Léon",
                  hour: "13:00h",
                  location: "Calle Ancha",
                  image: "assets/catedral.jpeg",
                  url:
                      'https://www.google.com/maps/place/Catedral+de+Le%C3%B3n/@42.5994383,-5.5671632,15z/data=!4m6!3m5!1s0xd379a9b863a0fab:0x13727554f4d5e06a!8m2!3d42.5994383!4d-5.5671632!16zL20vMDc3MF9z?entry=ttu',
                ),
                SizedBox(height: screenHeight * 0.02),
                const MyCustomPlace(
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
          ))
          /* SizedBox(
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
                    ) */
          ,
          SliverToBoxAdapter(
              child: SizedBox(
                  height: screenHeight * 0.1,
                  width: screenWidth,
                  child: Center(
                      child: SizedBox(
                          width: screenHeight * 0.8,
                          height: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffBE9E49),
                              elevation: 0,
                            ),
                            onPressed: () {
                              isClicked = !isClicked;
                            },
                            child: const Text("CONFIRMAR ASISTENCIA"),
                          ))))),
          SliverToBoxAdapter(
              child: isClicked
                  ? Container(
                      child: Center(
                          child: Column(children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      const MyCustomForm()
                    ])))
                  : Container())
        ],
      ),
    );
  }
}
