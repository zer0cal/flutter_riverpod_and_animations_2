// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;
import 'package:flutter_riverpod_and_animations_2/providers/animatedlist_provider.dart';

class AnimatedListItemWidget extends ConsumerStatefulWidget {
  const AnimatedListItemWidget({super.key});

  @override
  ConsumerState<AnimatedListItemWidget> createState() => _AnimatedListItemWidgetState();
}

class _AnimatedListItemWidgetState extends ConsumerState<AnimatedListItemWidget>
    with TickerProviderStateMixin {
  late final AnimationController _opacityAnimationController  = AnimationController(
        vsync: this, duration: const Duration(microseconds: 500));
  late final AnimationController _containerAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

  late final Animation<double> _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _opacityAnimation, curve: Curves.easeIn));
  late final Animation<double> _heightAnimation = Tween<double>(begin: 100, end: 300).animate(
        CurvedAnimation(parent: _heightAnimation, curve: Curves.easeIn));

  // @override
  // void initState() {
  //   super.initState();
  //   _opacityAnimationController.forward();
  //   _containerAnimationController.forward();
  // }

  // @override
  // void dispose() {
  //   _containerAnimationController.dispose();
  //   _opacityAnimationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(selfDeleteProvider, (previous, next) {
      if (next) {
        _opacityAnimationController.reverse();
        _containerAnimationController.reverse();
        // dispose();
      }
    });
    return AnimatedBuilder(
      animation: Listenable.merge(
          [_containerAnimationController, _opacityAnimationController]),
      child: const Text('elo'),
      builder: (context, child) {
        log.tweenAnimation(this, '[_opacityAnimation, _heightAnimation]');
        return SizedBox(
          height: 300,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: SizedBox(height: _heightAnimation.value, child: child),
          ),
        );
      },
    );
  }
}
