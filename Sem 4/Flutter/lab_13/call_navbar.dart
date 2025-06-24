import 'package:flutter/material.dart';

class CallNavbar extends StatelessWidget {
  const CallNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Calls",
        style: TextStyle(fontSize: 100),
      )),
    );
  }
}
