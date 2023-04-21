// dart packages
import 'dart:developer' as dev;
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/providers/counter_provider.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(context, ref) {
    dev.log('CounterWidget.build()', name: 'counter_widget.dart', level: 0);

    final counter = ref.watch(counterProvider);

    return FadeInHook(child: Center(
      child: Text(counter.value.toString()),
    ));
  }
}

class FadeInHook extends HookWidget {
  const FadeInHook({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    dev.log('FadeInHook.build()', name: 'counter_widget.dart', level: 0);

    final animationConstroler =
        useAnimationController(duration: const Duration(seconds: 2));

    useEffect(() {
      animationConstroler.forward();

      return null;
    });

    useAnimation(animationConstroler);

    return Opacity(
      opacity: animationConstroler.value,
      child: child
    );
  }
}