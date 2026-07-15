import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// A container that applies a list of effects to its child.
class CustomAnimatedContainer extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The duration of the animation.
  final Duration duration;

  /// The delay before the animation starts.
  final Duration delay;

  /// The list of effects to apply.
  final List<AnimationEffect> effects;

  /// Whether the animation should repeat indefinitely.
  final bool repeat;

  /// Whether the animation should reverse after completing.
  final bool reverse;

  /// Creates a [CustomAnimatedContainer].
  const CustomAnimatedContainer({
    super.key,
    required this.child,
    required this.effects,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.repeat = false,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return ParallelBuilder(
      duration: duration,
      delay: delay,
      repeat: repeat,
      reverse: reverse,
      effects: effects,
      child: child,
    );
  }
}
