
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/screens/home.dart';
import 'package:flutter_riverpod_and_animations_2/screens/counter.dart';
import 'package:flutter_riverpod_and_animations_2/screens/animatedbox.dart';
import 'logging.dart' as log;

void main() => runApp(const ProviderScope(child: App()));

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log.widgetBuild(this);
    
    return MaterialApp(
      title: 'Riverpod 2.0 with animations',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/counter': (context) => const CounterScreen(),
        '/animatedbox': (context) => const AnimatedboxScreen(),
      },
    );
  }
}
