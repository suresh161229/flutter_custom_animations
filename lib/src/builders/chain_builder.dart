import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/src/effects/animation_effect.dart';
import 'package:flutter_custom_animations/src/builders/flutter_custom_animations_builder.dart';

/// Wraps an effect with its own explicit duration inside a ChainBuilder.
class ChainedEffect {
  /// The effect to apply.
  final AnimationEffect effect;

  /// The duration of the animation.
  final Duration duration;

  const ChainedEffect(this.effect, this.duration);
}

/// Runs a sequence of effects where each defines its own explicit duration.
class ChainBuilder extends StatelessWidget {
  /// Documentation for [chainedEffects].
  final List<ChainedEffect> chainedEffects;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The delay before the animation starts.
  final Duration? delay;

  /// Whether the animation should repeat indefinitely.
  final bool repeat;

  /// Whether the animation should reverse after completing.
  final bool reverse;

  /// Whether the animation should start automatically.
  final bool autoPlay;

  /// Documentation for [onStart].
  final VoidCallback? onStart;

  /// Documentation for [onComplete].
  final VoidCallback? onComplete;

  /// Creates a [ChainBuilder].
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

    /// A property of this class.
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
          /// A property of this class.
          final fraction = e.duration.inMilliseconds / totalMillis;

          /// The final value for this animation.
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
