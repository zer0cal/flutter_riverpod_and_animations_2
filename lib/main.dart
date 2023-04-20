// dart packages
import 'dart:developer' as dev;
// fluter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'screens/home_screen.dart';
import 'screens/counter_screen.dart';

void main() => runApp(const ProviderScope(child: App()));

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dev.log('App.build()', name: 'main.dart');
    return MaterialApp(
      title: 'Riverpod 2.0 with animations',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/counter':(context) => const CounterScreen(),
      },
    );
  }
}
