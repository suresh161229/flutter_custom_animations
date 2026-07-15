import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/src/effects/animation_effect.dart';
import 'package:flutter_custom_animations/src/builders/flutter_custom_animations_builder.dart';

/// Runs multiple effects simultaneously.
class ParallelBuilder extends StatelessWidget {
  /// The list of effects to apply.
  final List<AnimationEffect> effects;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The duration of the animation.
  final Duration? duration;

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

  /// Creates a [ParallelBuilder].
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
