import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

// Create a Form widget.
class MyCustomPlace extends StatefulWidget {
  final String event;
  final String namePlace;
  final String hour;
  final String location;
  final String image;
  final String url;
  const MyCustomPlace(
      {Key? key,
      required this.event,
      required this.namePlace,
      required this.hour,
      required this.location,
      required this.image,
      required this.url})
      : super(key: key);

  @override
  MyCustomPlaceState createState() {
    return MyCustomPlaceState();
  }
}

class MyCustomPlaceState extends State<MyCustomPlace> {
  void _openMaps() async {
    final availableMas = await MapLauncher.installedMaps;
    for (var element in availableMas) {
      print(element.icon);
      print(element.mapName);
      print(element.mapType);
    }
    print(availableMas);
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
        shape: const RoundedRectangleBorder(
            side: BorderSide(
          color: Color(0xff69491e),
        )),
        child: Container(
            width: screenWidth * 0.9,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 235, 231),
            ),
            child: Column(
              children: [
                Image.asset(
                  widget.image,
                  width: screenWidth * 0.9,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  widget.event,
                  style: GoogleFonts.cormorantGaramond(
                      fontSize: screenHeight * 0.04,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
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
                SizedBox(height: screenHeight * 0.01),
                Text(
                  widget.location,
                  style: GoogleFonts.cormorantGaramond(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff69491e),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    //_openMaps();
                    _launchUrl(widget.url);
                  },
                  child: Text(
                    "VER MAPA",
                    style: GoogleFonts.cormorantGaramond(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w400),
                    selectionColor: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            )));
  }
}
