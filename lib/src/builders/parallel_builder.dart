import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/effects/animation_effect.dart';
import 'package:custom_animation/src/builders/custom_animation_builder.dart';

/// Runs multiple effects simultaneously.
class ParallelBuilder extends StatelessWidget {
  final List<AnimationEffect> effects;
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const ParallelBuilder({
    super.key,
    required this.effects,
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
        Widget result = child;
        for (final effect in effects) {
          result = effect.build(context, result, animation);
        }
        return result;
      },
    );
  }
}
