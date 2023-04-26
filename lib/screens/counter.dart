// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// projcet files
import 'package:flutter_riverpod_and_animations_2/providers/counter.dart';
import 'package:flutter_riverpod_and_animations_2/widgets/counter.dart';
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log.widgetBuild(this);

    return Scaffold(
      body: Center(
        child: Column(
                children: [
                  const CounterWidget(),
                  TextButton(onPressed: () => ref.read(counterProvider.notifier).increment(), child: const Text('increase')),
                  TextButton(onPressed: () => ref.read(counterProvider.notifier).decrement(), child: const Text('decrease')),
                  TextButton(onPressed: () => ref.read(counterProvider.notifier).reset(), child: const Text('reset')),
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Home')),
                ],
              ),
      ),
    );
  }
}