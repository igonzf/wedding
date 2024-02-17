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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
          'assets/pruebaaa.png',
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
