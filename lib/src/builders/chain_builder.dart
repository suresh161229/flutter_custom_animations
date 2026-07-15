import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/effects/animation_effect.dart';
import 'package:custom_animation/src/builders/custom_animation_builder.dart';

/// Wraps an effect with its own explicit duration inside a ChainBuilder.
class ChainedEffect {
  final AnimationEffect effect;
  final Duration duration;
  
  const ChainedEffect(this.effect, this.duration);
}

/// Runs a sequence of effects where each defines its own explicit duration.
class ChainBuilder extends StatelessWidget {
  final List<ChainedEffect> chainedEffects;
  final Widget child;
  final Duration? delay;
  final bool repeat;
  final bool reverse;
  final bool autoPlay;
  final VoidCallback? onStart;
  final VoidCallback? onComplete;

  const ChainBuilder({
    super.key,
    required this.chainedEffects,
    required this.child,
    this.delay,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    if (chainedEffects.isEmpty) return child;

    // Calculate total duration across all chained items
    int totalMillis = 0;
    for (final e in chainedEffects) {
      totalMillis += e.duration.inMilliseconds;
    }
    
    // Fallback to 1ms to prevent division by zero if all durations are zero
    if (totalMillis == 0) totalMillis = 1;
    
    final totalDuration = Duration(milliseconds: totalMillis);

    return CustomAnimationBuilder(
      duration: totalDuration,
      delay: delay,
      repeat: repeat,
      reverse: reverse,
      autoPlay: autoPlay,
      onStart: onStart,
      onComplete: onComplete,
      child: child,
      builder: (context, child, animation) {
        Widget result = child;
        
        double currentStart = 0.0;
        
        for (final e in chainedEffects) {
          final fraction = e.duration.inMilliseconds / totalMillis;
          final end = (currentStart + fraction).clamp(0.0, 1.0);
          
          final chainAnimation = CurvedAnimation(
            parent: animation,
            curve: Interval(currentStart, end),
          );
          
          result = e.effect.build(context, result, chainAnimation);
          currentStart = end;
        }
        return result;
      },
    );
  }
}
