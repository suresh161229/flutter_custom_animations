import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';
import 'dart:math' as math;

/// An animated widget that applies a jelly (squash and stretch) effect to its child.
class JellyAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const JellyAnimation({
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
        // Squash and stretch by alternating scaleX and scaleY
        final x = 1.0 + math.sin(value * math.pi * 3) * math.cos(value * math.pi / 2) * 0.25;
        final y = 1.0 - math.sin(value * math.pi * 3) * math.cos(value * math.pi / 2) * 0.25;
        
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(x, y, 1.0),
          child: child,
        );
      },
    );
  }
}
