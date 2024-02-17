import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:invitacion/timeLeft.dart';
import 'package:invitacion/form.dart';
import 'package:invitacion/place.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_animated_icons/flutter_animated_icons.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:lottie/lottie.dart';

class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key, required this.title});
  final String title;

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage>
    with TickerProviderStateMixin {
  bool isClicked = false;
  AudioPlayer audioPlayer = AudioPlayer();
  bool musicOn = true;
  bool animationFinished = false;
  List<int> _timeUntil = List<int>.filled(4, 0);
  int index = 0;
  Timer? _timer;
  final scrollController = ScrollController();
  AnimationController? _fraseAnimation;
  AnimationController? _cuentaAnimation;
  AnimationController? _slideDown;
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  final key4 = GlobalKey();
  var keyform = GlobalKey();
  Offset position1 = Offset(0.0, 0.0);
  Offset position2 = Offset(0.0, 0.0);
  Offset position3 = Offset(0.0, 0.0);
  Offset position4 = Offset(0.0, 0.0);
  Offset positionform = Offset(0.0, 0.0);

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeUntil = TimeLeft().timeLeft(DateTime(2024, 6, 22, 14, 00));
      });
    });
  }

  void _finishAnimation() {
    setState(() {
      animationFinished = false;
    });
  }

  void onListen() {
    //print('scrollController: ${scrollController.offset}');
    if (scrollController.offset > 0.0) {
      _finishAnimation();
    }
    RenderBox box1 = key1.currentContext?.findRenderObject() as RenderBox;
    RenderBox box2 = key2.currentContext?.findRenderObject() as RenderBox;
    RenderBox box3 = key3.currentContext?.findRenderObject() as RenderBox;
    RenderBox box4 = key4.currentContext?.findRenderObject() as RenderBox;

    position1 = box1.localToGlobal(Offset.zero);
    position2 = box2.localToGlobal(Offset.zero);
    position3 = box3.localToGlobal(Offset.zero);
    position4 = box4.localToGlobal(Offset.zero);

    //print('p1: ${position1.dy}');
    //print('p2: ${position2.dy}');
    //print('p3: ${position3.dy}');
    //print('p4: ${position4.dy}');

    /* RenderBox boxform = keyform.currentContext?.findRenderObject() as RenderBox;
    positionform = boxform.localToGlobal(Offset.zero);
    print('form: ${positionform.dy}'); */
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
    loadAudio();
    _startTimer();
    _slideDown =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  void loadAudio() async {
    await audioPlayer.setSource(DeviceFileSource('./assets/assets/music.mp3'));
    audioPlayer.setReleaseMode(
        ReleaseMode.loop); // Para reproducir en bucle si es necesario
    audioPlayer.seek(Duration(
        seconds:
            2)); // Asegúrate de que la reproducción comience desde el principio
    audioPlayer.setVolume(1.0); // Ajusta el volumen según sea necesario
    audioPlayer.play(DeviceFileSource(
        './assets/assets/music.mp3')); // Note: 'play' is used to start playing immediately, no need for 'setUrl' in this case
  }

  void playPause() {
    if (musicOn) {
      audioPlayer.pause();
    } else {
      audioPlayer.resume(); // Resume if paused, in case it was paused before
    }
    setState(() {
      musicOn = !musicOn;
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    audioPlayer.dispose();
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
                      style: TextStyle(
                          fontFamily: 'Cinzel',
                          fontSize: screenHeight * 0.03,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    )
                        .animate(autoPlay: true)
                        .scale(duration: Duration(seconds: 3)),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      'Bárbara',
                      style: TextStyle(
                          fontFamily: 'GreatVibes',
                          fontSize: screenHeight * 0.10,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    )
                        .animate(autoPlay: true)
                        .slideX(begin: 2.0, duration: Duration(seconds: 3)),
                    Text(
                      'y',
                      style: TextStyle(
                        fontFamily: 'GreatVibes',
                        fontSize: screenHeight * 0.10,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                        .animate(autoPlay: true)
                        .scale(duration: Duration(seconds: 3)),
                    Text(
                      'Santi',
                      style: TextStyle(
                          fontFamily: 'GreatVibes',
                          fontSize: screenHeight * 0.10,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    )
                        .animate(
                            autoPlay: true,
                            onComplete: (controller) =>
                                animationFinished = !animationFinished)
                        .slideX(begin: -2.0, duration: Duration(seconds: 3)),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      '22 DE JUNIO DE 2024',
                      style: TextStyle(
                          fontFamily: 'Cinzel',
                          fontSize: screenHeight * 0.03,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    )
                        .animate(autoPlay: true)
                        .scale(duration: Duration(seconds: 3)),
                  ])),
              animationFinished
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                          opacity: 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset('assets/animations/slide.json',
                                  height: screenHeight * 0.1)
                            ],
                          )))
                  : Align(),
            ]),
          )),
          SliverToBoxAdapter(
            child: Container(
                height: screenHeight * 0.4,
                color: const Color(0xff9ab4ac),
                child: VisibilityDetector(
                    key: Key('frasecita'),
                    onVisibilityChanged: (visibilityInfo) {
                      setState(() {
                        // Change the flag value of _isVisible
                        // If it is greater than 0 means it is visible
                        //_isVisible = visibilityInfo.visibleFraction > 0;

                        // It will show how much percentage the widget is visible
                        var visiblePercentage =
                            visibilityInfo.visibleFraction * 100;

                        print(
                            'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');

                        if (visiblePercentage == 100) {
                          _fraseAnimation?.forward();
                        }
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                            child: Column(
                          children: [
                            const Spacer(),
                            Text(
                              'La cuenta atrás ha comenzado para el día más importante de nuestras vidas. Queremos que sea un día lleno de risas, alegrías, amor y recuerdos inolvidables, por eso necesitamos que nos acompañéis para que nuestro día sea aún más especial.',
                              style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.023,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                                .animate(
                                    autoPlay: false,
                                    onInit: (c) => _fraseAnimation = c)
                                .scale(duration: Duration(seconds: 2)),
                            const Spacer(),
                            //SizedBox(height: screenHeight * 0.01),
                            const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.white,
                              size: 15,
                            ),
                            //const Spacer()
                            SizedBox(height: screenHeight * 0.03)
                          ],
                        ))))),
          ),
          SliverToBoxAdapter(
            child: VisibilityDetector(
                key: Key('cuenta'),
                onVisibilityChanged: (visibilityInfoCuenta) {
                  setState(() {
                    // Change the flag value of _isVisible
                    // If it is greater than 0 means it is visible
                    //_isVisible = visibilityInfo.visibleFraction > 0;

                    // It will show how much percentage the widget is visible
                    var visiblePercentageCuenta =
                        visibilityInfoCuenta.visibleFraction * 100;

                    print(
                        'Widget ${visibilityInfoCuenta.key} is ${visiblePercentageCuenta}% visible');

                    if (visiblePercentageCuenta == 100) {
                      _cuentaAnimation?.forward();
                    }
                  });
                },
                child: SizedBox(
                    height: screenHeight * 0.6,
                    width: screenWidth,
                    child: Stack(children: <Widget>[
                      Image.asset(
                        'assets/cuentaatrás.png',
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
                          )
                              .animate(
                                  autoPlay: false,
                                  onInit: (cr) => _cuentaAnimation = cr)
                              .scale(duration: Duration(seconds: 2)),
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
                    ]))),
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
                              ? Color.fromARGB(255, 131, 104, 70)
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
                                : Color.fromARGB(255, 131, 104, 70)),
                        alignment: TimelineAlign.center,
                        startChild: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '19:00h\nViernes',
                                style: GoogleFonts.cormorantGaramond(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.w400,
                                  color: position1.dy > 150
                                      ? Color.fromARGB(255, 131, 104, 70)
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
                                            ? Color.fromARGB(255, 131, 104, 70)
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
                              ? Color.fromARGB(255, 131, 104, 70)
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
                                : Color.fromARGB(255, 131, 104, 70)),
                        afterLineStyle: LineStyle(
                            color: position2.dy < 150
                                ? Colors.black
                                : Color.fromARGB(255, 131, 104, 70)),
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
                                        ? Color.fromARGB(255, 131, 104, 70)
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
                                            ? Color.fromARGB(255, 131, 104, 70)
                                            : Colors.black),
                                  ),
                                  Text(
                                    'Religiosa',
                                    style: GoogleFonts.cormorantGaramond(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: position2.dy > 150
                                            ? Color.fromARGB(255, 131, 104, 70)
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
                              ? Color.fromARGB(255, 131, 104, 70)
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
                                : Color.fromARGB(255, 131, 104, 70)),
                        afterLineStyle: LineStyle(
                            color: position3.dy < 150
                                ? Colors.black
                                : Color.fromARGB(255, 131, 104, 70)),
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
                                        ? Color.fromARGB(255, 131, 104, 70)
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
                                          ? Color.fromARGB(255, 131, 104, 70)
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
                              ? Color.fromARGB(255, 131, 104, 70)
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
                                : Color.fromARGB(255, 131, 104, 70)),
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
                                        ? Color.fromARGB(255, 131, 104, 70)
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
                                            ? Color.fromARGB(255, 131, 104, 70)
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
                  hour: "Viernes 21 a las 19:00h",
                  location: "Grulleros",
                  image: "assets/preboda1.jpeg",
                  url:
                      'https://www.google.es/maps/place/Tr.%C2%AA+Estanco,+382,+24346+Vega+de+Infanzones,+Le%C3%B3n/@42.5021784,-5.5547116,17z/data=!3m1!4b1!4m14!1m7!3m6!1s0xd378f4c23befd67:0x447744725b26eb63!2sC.+Real,+61,+24346+Vega+de+Infanzones,+Le%C3%B3n!3b1!8m2!3d42.4991532!4d-5.5468437!3m5!1s0xd378f4e49a18dab:0x384413e23ed0dc08!8m2!3d42.5021785!4d-5.5498407!16s%2Fg%2F11c27fcm05?entry=ttu',
                ),
                SizedBox(height: screenHeight * 0.02),
                const MyCustomPlace(
                  event: "Ceremonia Religiosa",
                  namePlace: "Catedral de Léon",
                  hour: "13:00h\n(llegar a las 12:45h\ny esperar dentro)",
                  location: "Calle Ancha",
                  image: "assets/catedral2.jpeg",
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
          )),
          SliverToBoxAdapter(
              child: !isClicked
                  ? SizedBox(
                      width: screenWidth,
                      child: Column(children: [
                        SizedBox(height: screenHeight * 0.05),
                        Card(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(
                            color: Color(0xff69491e),
                          )),
                          child: Container(
                              width: screenWidth * 0.9,
                              decoration: const BoxDecoration(
                                color: Color(0xff69491e),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                      child: Column(
                                    children: [
                                      Text(
                                        '¡Queremos compartir este día tan especial con vosotros!\n\nPor favor, dedicad unos minutos para confirmar vuestra asistencia.\nHaz clic en el botón y completa tus datos.\n\n¡Esperamos veros en la boda!',
                                        style: GoogleFonts.cormorantGaramond(
                                            fontSize: screenHeight * 0.03,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 236, 235, 231)),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: screenHeight * 0.03),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 236, 235, 231),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          isClicked = !isClicked;
                                        },
                                        child: Text(
                                          'CONFIRMAR ASISTENCIA ',
                                          style: GoogleFonts.cormorantGaramond(
                                              color: Color(0xff69491e),
                                              fontSize: screenHeight * 0.03),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )))),
                        ),
                        SizedBox(height: screenHeight * 0.05)
                      ]))
                  : SizedBox()),
          SliverToBoxAdapter(
              child: isClicked
                  ? Container(
                      child: Center(
                          child: Column(children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      MyCustomForm(testFunction: testFunction)
                    ])))
                  : Container())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xff9ab4ac),
        onPressed: playPause,
        child: Icon(musicOn ? Icons.pause : Icons.music_note),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  testFunction(bool checkValue) {
    isClicked = checkValue;
  }
}
