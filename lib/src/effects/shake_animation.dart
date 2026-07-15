import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';
import 'dart:math' as math;

/// An animated widget that applies a shake effect to its child.
class ShakeAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const ShakeAnimation({
    super.key,
    required this.child,
    this.duration,
    this.delay,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder(
      duration: duration,
      delay: delay,
      repeat: repeat,
      reverse: reverse,
      autoPlay: autoPlay,
      onStart: onStart,
      onComplete: onComplete,
      child: child,
      builder: (context, child, animation) {
        final dx = math.sin(animation.value * math.pi * 6) * 10;
        return Transform.translate(
          offset: Offset(dx, 0),
          child: child,
        );
      },
    );
  }
}
