import 'dart:ui' show ImageFilter;
import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated widget that applies a blur effect to its child.
class BlurAnimation extends StatelessWidget {
  final Widget child;
  final double begin;
  final double end;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const BlurAnimation({
    super.key,
    required this.child,
    this.begin = 10.0,
    this.end = 0.0,
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
        final sigma = begin + (end - begin) * animation.value;
        return ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: child,
        );
      },
    );
  }
}
