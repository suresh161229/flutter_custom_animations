import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/src/effects/animation_effect.dart';
import 'package:flutter_custom_animations/src/builders/flutter_custom_animations_builder.dart';

/// A simple builder that applies a single effect to its child.
class EffectBuilder extends StatelessWidget {
  /// The effect to apply.
  final AnimationEffect effect;

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

  /// Creates a [EffectBuilder].
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
