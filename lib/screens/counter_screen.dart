// dart packages
import 'dart:developer' as dev;
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// projcet files
import 'package:flutter_riverpod_and_animations_2/providers/counter_provider.dart';
import 'package:flutter_riverpod_and_animations_2/widgets/counter_widget.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dev.log('CounterScreen.build()', name: 'counter_screen.dart');

    return Scaffold(
      body: Column(
              children: [
                const CounterWidget(),
                TextButton(onPressed: () => ref.read(counterProvider.notifier).increment(), child: const Text('increase')),
                TextButton(onPressed: () => ref.read(counterProvider.notifier).decrement(), child: const Text('decrease')),
                TextButton(onPressed: () => ref.read(counterProvider.notifier).reset(), child: const Text('reset')),
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Home')),
              ],
            ),
    );
  }
}