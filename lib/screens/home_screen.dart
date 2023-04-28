// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log.widgetBuild(this);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(onPressed: () => Navigator.pushNamed(context, '/counter'), child: const Text('Counter')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/animatedbox'), child: const Text('AnimatedBox')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/animatedlist'), child: const Text('AnimatedList'))
          ],
        ),
      ),
    );
  }
}