// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// project files
import 'package:flutter_riverpod_and_animations_2/logging.dart' as log;

class AnimatedListItemWidget extends ConsumerStatefulWidget {
  const AnimatedListItemWidget(
      {super.key, required this.index, required this.onDelete, required this.child});

  final Function onDelete;
  final int index;
  final Widget child;

  @override
  ConsumerState<AnimatedListItemWidget> createState() =>
      _AnimatedListItemWidgetState();
}

class _AnimatedListItemWidgetState extends ConsumerState<AnimatedListItemWidget>
    with TickerProviderStateMixin {
  // animation controllers
  late final AnimationController _opacityAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 200));
  late final AnimationController _containerAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 300));
  // animations
  late final Animation<double> _opacityAnimation =
      Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
          parent: _opacityAnimationController, curve: Curves.easeIn));
  late final Animation<double> _heightAnimation =
      Tween<double>(begin: 0, end: 50).animate(CurvedAnimation(
          parent: _containerAnimationController, curve: Curves.easeIn));

  @override
  void initState() {
    super.initState();
    _opacityAnimationController.forward();
    _containerAnimationController.forward();
  }

  @override
  dispose() {
    _opacityAnimationController.dispose();
    _containerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
          [_containerAnimationController, _opacityAnimationController]),
      builder: (context, child) {
        log.animationBuilder(this, '[_opacityAnimation, _heightAnimation]');
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Container(
                height: _heightAnimation.value,
                width: 200,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [BoxShadow(color: Colors.lime.shade100, blurRadius: 4.0, spreadRadius: 4.0)]),
                    
                child: Center(
                  child: Row(
                    children: [
                      widget.child,
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            // _opacityAnimationController.reverse();
                            // _containerAnimationController.reverse().whenComplete(() => widget.onDelete());
                            widget.onDelete();
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
