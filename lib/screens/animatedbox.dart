// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;
import 'package:flutter_riverpod_and_animations_2/providers/animatedbox.dart';
import 'package:flutter_riverpod_and_animations_2/widgets/animatedbox.dart';

class AnimatedboxScreen extends ConsumerWidget {
  const AnimatedboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log.widgetBuild(this);
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const AnimatedboxWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () { ref.read(sizeProvider.notifier).increase(50); }, child: const Text('+')),
                ElevatedButton(onPressed: () { ref.read(sizeProvider.notifier).decrease(50); }, child: const Text('-'))
              ],
            ),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Home')),
          ],
        ),
      ),
    );
  }
}