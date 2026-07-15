import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';
import 'dart:math' as math;

/// An animated widget that applies a pulse effect to its child.
class PulseAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const PulseAnimation({
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
        final scale = 1.0 + (math.sin(animation.value * math.pi) * 0.1);
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
    );
  }
}
