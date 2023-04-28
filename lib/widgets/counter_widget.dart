
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/providers/counter_provider.dart';
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(context, ref) {
    log.widgetBuild(this);

    final counter = ref.watch(counterProvider);

    return FadeInHook(
        provider: counterProvider,
        child: Center(
          child: Text(counter.value.toString(), style: const TextStyle(fontSize: 30),),
        ));
  }
}

class FadeInHook extends HookWidget {
  const FadeInHook(
      {Key? key, required this.child, required this.provider})
      : super(key: key);

  final Widget child;
  final StateNotifierProvider provider;

  @override
  Widget build(BuildContext context) {
    log.hookAnimation(this, 'fade_in');

    final animationConstroller =
        useAnimationController(duration: const Duration(seconds: 1));

    useEffect(() {
      animationConstroller.forward();

      return null;
    });

    useAnimation(animationConstroller);

    return Consumer(builder: (context, ref, widget) {
      ref.listen(provider, (previous, next) {
        animationConstroller.reset();
      });
      return Opacity(
        opacity: animationConstroller.value,
        child: child,
      );
    });
  }
}
