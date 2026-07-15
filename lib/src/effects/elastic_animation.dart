import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated widget that applies an elastic effect to its child.
class ElasticAnimation extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const ElasticAnimation({
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
      duration: duration ?? const Duration(milliseconds: 1000), // Elastic needs a slightly longer default
      delay: delay,
      curve: Curves.elasticOut, // Overriding curve explicitly for elastic effect
      repeat: repeat,
      reverse: reverse,
      autoPlay: autoPlay,
      onStart: onStart,
      onComplete: onComplete,
      child: child,
      builder: (context, child, animation) {
        return Transform.scale(
          scale: animation.value,
          child: child,
        );
      },
    );
  }
}
