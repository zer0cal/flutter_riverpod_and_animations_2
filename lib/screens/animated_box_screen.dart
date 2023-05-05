// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;
import 'package:flutter_riverpod_and_animations_2/providers/animated_box_provider.dart';
import 'package:flutter_riverpod_and_animations_2/widgets/animated_box_widget.dart';

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () { ref.read(sizeProvider.notifier).increase(20); }, child: const Icon(Icons.add))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () { ref.read(sizeProvider.notifier).decrease(20); }, child: const Icon(Icons.remove)),
                )
              ],
            ),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Home')),
          ],
        ),
      ),
    );
  }
}