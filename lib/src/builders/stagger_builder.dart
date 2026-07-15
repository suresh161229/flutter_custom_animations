import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/effects/animation_effect.dart';
import 'package:custom_animation/src/builders/custom_animation_builder.dart';

/// Runs multiple effects with an overlapping staggered delay.
class StaggerBuilder extends StatelessWidget {
  /// The list of effects to apply.
  final List<AnimationEffect> effects;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The duration of the animation.
  final Duration? duration;

  /// The delay before the animation starts.
  final Duration? delay;
  final double staggerRatio; // e.g., 0.2 means 20% interval gap
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

  /// Creates a [StaggerBuilder].
  const StaggerBuilder({
    super.key,
    required this.effects,
    required this.child,
    this.duration,
    this.delay,
    this.staggerRatio = 0.2, // 0.0 means parallel, 1.0 means sequence
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

        // E = Individual Effect Duration
        // S = Stagger step size
        // If staggerRatio is passed, let's treat it as S / E.
        // E = 1.0 / (1.0 + (N-1) * staggerRatio)

        /// A property of this class.
        final eLen = 1.0 / (1.0 + (effects.length - 1) * staggerRatio);

        /// A property of this class.
        final sLen = staggerRatio * eLen;

        Widget result = child;

        for (int i = 0; i < effects.length; i++) {
          /// A property of this class.
          final startTime = i * sLen;

          /// A property of this class.
          final endTime = (startTime + eLen).clamp(0.0, 1.0);

          final staggerAnimation = CurvedAnimation(
            parent: animation,
            curve: Interval(startTime, endTime),
          );

          result = effects[i].build(context, result, staggerAnimation);
        }
        return result;
      },
    );
  }
}
