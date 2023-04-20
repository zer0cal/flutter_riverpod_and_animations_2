// dart packages
import 'dart:developer' as dev;
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_and_animations_2/providers/counter_provider.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dev.log('CounterWidget.build()', name: 'counter_widget.dart');
    final counter = ref.watch(counterProvider);
    
    return SizedBox(child: Text(counter.value.toString()));
  }
}