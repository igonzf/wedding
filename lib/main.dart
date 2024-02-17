import 'package:flutter/material.dart';
import 'package:invitacion/invitation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor myColor = _createMaterialColor(Colors.brown);
    return MaterialApp(
      title: 'Invitación Bárbara y Santi',
      theme: ThemeData(
          //primaryColor: Colors.white, // Establece el color principal de la app
          primarySwatch: myColor),
      home: const MyHomePage(title: 'Invitación Bárbara y Santi'),
    );
  }

  // Método para crear un MaterialColor personalizado
  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Image.asset(
          'assets/sobresello.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
        GestureDetector(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const InvitationPage(title: 'InvitationPage');
          }));
        })
        /* Center(
          child: FloatingActionButton(
            backgroundColor: Colors.blueGrey.withOpacity(0.0),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InvitationPage(title: 'InvitationPage');
              }));
            },
            tooltip: 'open invitation',
            child: Image.asset(
              'assets/sello.png',
              scale: 0.8,
            ),
          ),
        ) */
      ]),
    );
  }
}
