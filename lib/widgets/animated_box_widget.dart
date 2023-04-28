// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;
import 'package:flutter_riverpod_and_animations_2/providers/animatedbox_provider.dart';

class AnimatedboxWidget extends ConsumerStatefulWidget {
  const AnimatedboxWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedboxWidgetState();
}

class _AnimatedboxWidgetState extends ConsumerState<AnimatedboxWidget> {
  @override
  Widget build(BuildContext context) {
    log.widgetBuild(this);
    final size = ref.watch(sizeProvider);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: size, end: size),
      duration: const Duration(seconds: 2),
      curve: Curves.bounceOut,
      builder: (context, value, child) {
        log.tweenAnimation(this, 'box_size');
        return SizedBox(
          width: value,
          height: value,
          child: Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 191, 0)),
            child: Center(
                child: Text(
              '${value.toStringAsFixed(2)}\n${size.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        );
      },
    );
  }
}
