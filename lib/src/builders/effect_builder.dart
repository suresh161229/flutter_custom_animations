import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/effects/animation_effect.dart';
import 'package:custom_animation/src/builders/custom_animation_builder.dart';

/// A simple builder that applies a single effect to its child.
class EffectBuilder extends StatelessWidget {
  final AnimationEffect effect;
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const EffectBuilder({
    super.key,
    required this.effect,
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
        return effect.build(context, child, animation);
      },
    );
  }
}
