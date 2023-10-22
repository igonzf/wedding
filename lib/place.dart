import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:developer';
import 'package:invitacion/model/feedback.dart';
import 'package:invitacion/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

// Create a Form widget.
class MyCustomPlace extends StatefulWidget {
  final String event;
  final String namePlace;
  final String hour;
  final String location;
  final String image;
  final List<double> coord;
  const MyCustomPlace(
      {Key? key,
      required this.event,
      required this.namePlace,
      required this.hour,
      required this.location,
      required this.image,
      required this.coord})
      : super(key: key);

  @override
  MyCustomPlaceState createState() {
    return MyCustomPlaceState();
  }
}

class MyCustomPlaceState extends State<MyCustomPlace> {
  void _openMaps() async {
    final availableMas = await MapLauncher.installedMaps;
    availableMas.forEach((element) {
      print(element.icon);
      print(element.mapName);
      print(element.mapType);
    });
    print(availableMas);
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(
        'https://www.google.com/maps/place/Catedral+de+Le%C3%B3n/@42.5994383,-5.5671632,15z/data=!4m6!3m5!1s0xd379a9b863a0fab:0x13727554f4d5e06a!8m2!3d42.5994383!4d-5.5671632!16zL20vMDc3MF9z?entry=ttu'))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
        child: Container(
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 235, 231),
            ),
            child: Padding(
                padding: EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    Image.asset(
                      widget.image,
                      height: screenHeight * 0.3,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      widget.event,
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.namePlace,
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.hour,
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.location,
                      style: GoogleFonts.cormorantGaramond(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      child: Text("Ver mapa"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffBE9E49),
                        elevation: 0,
                      ),
                      onPressed: () {
                        //_openMaps();
                        _launchUrl();
                      },
                    )
                  ],
                ))));
  }
}
