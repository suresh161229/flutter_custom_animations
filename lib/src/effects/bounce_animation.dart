import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';
import 'dart:math' as math;

/// An animated widget that applies a bounce effect to its child.
class BounceAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const BounceAnimation({
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
        final value = animation.value;
        // Dampened sine wave for a realistic bounce
        final dy = -math.sin(value * math.pi) * math.cos(value * math.pi * 2) * 20.0;
        return Transform.translate(
          offset: Offset(0, dy),
          child: child,
        );
      },
    );
  }
}
