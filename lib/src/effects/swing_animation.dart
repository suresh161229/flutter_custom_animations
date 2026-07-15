import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';
import 'dart:math' as math;

/// An animated widget that applies a swinging effect to its child.
class SwingAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const SwingAnimation({
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
        // Dampened sine wave for a swing
        final angle = math.sin(value * math.pi * 3) * math.cos(value * math.pi / 2) * 0.3;
        return Transform.rotate(
          angle: angle,
          alignment: Alignment.topCenter,
          child: child,
        );
      },
    );
  }
}
