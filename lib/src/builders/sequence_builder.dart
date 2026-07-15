import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/effects/animation_effect.dart';
import 'package:custom_animation/src/builders/custom_animation_builder.dart';

/// Runs multiple effects sequentially over the given total duration.
class SequenceBuilder extends StatelessWidget {
  final List<AnimationEffect> effects;
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const SequenceBuilder({
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
        if (effects.isEmpty) return child;
        
        final double step = 1.0 / effects.length;
        Widget result = child;
        
        for (int i = 0; i < effects.length; i++) {
          final start = i * step;
          final end = start + step;
          
          final sequenceAnimation = CurvedAnimation(
            parent: animation,
            curve: Interval(start, end),
          );
          
          result = effects[i].build(context, result, sequenceAnimation);
        }
        return result;
      },
    );
  }
}
