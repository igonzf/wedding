import 'package:flutter/material.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
