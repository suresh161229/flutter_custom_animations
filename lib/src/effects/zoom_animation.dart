import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated widget that applies a zoom effect (scale + fade) to its child.
class ZoomAnimation extends StatelessWidget {
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

  /// Creates a [ZoomAnimation].
  const ZoomAnimation({
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
      duration: duration,
      delay: delay,
      repeat: repeat,
      reverse: reverse,
      autoPlay: autoPlay,
      onStart: onStart,
      onComplete: onComplete,
      child: child,
      builder: (context, child, animation) {
        /// A property of this class.
        final value = animation.value;
        return Opacity(
          opacity: value,
          child: Transform.scale(scale: value, child: child),
        );
      },
    );
  }
}
