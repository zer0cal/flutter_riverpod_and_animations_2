// dart packages
import 'dart:developer' as dev;
// flutter packages
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dev.log('HomeScreen.build()', name: 'home_screen.dart', level: 0);

    return Scaffold(
      body: Column(
        children: <Widget>[
          TextButton(onPressed: () => Navigator.pushNamed(context, '/counter'), child: const Text('Counter'))
        ],
      ),
    );
  }
}