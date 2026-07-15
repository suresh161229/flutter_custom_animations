import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/src/core/constants.dart';

/// An immutable configuration class that defines how an animation should behave.
@immutable
class AnimationConfig {
  /// The duration of the animation.
  final Duration duration;

  /// The delay before the animation starts.
  final Duration delay;

  /// The curve used for the forward animation.
  final Curve curve;

  /// The curve used for the reverse animation.
  final Curve? reverseCurve;

  /// Whether the animation should repeat.
  final bool repeat;

  /// Whether the animation should reverse after completing.
  final bool reverse;

  /// Creates an [AnimationConfig] with default values provided by [AnimationConstants]
  /// and [AnimationDuration].
  const AnimationConfig({
    this.duration = AnimationDuration.normal,
    this.delay = AnimationConstants.defaultDelay,
    this.curve = AnimationCurves.defaultIn,
    this.reverseCurve,
    this.repeat = false,
    this.reverse = false,
  });

  /// Creates a copy of this config but with the given fields replaced with the new values.
  AnimationConfig copyWith({
    Duration? duration,
    Duration? delay,
    Curve? curve,
    Curve? reverseCurve,
    bool? repeat,
    bool? reverse,
  }) {
    return AnimationConfig(
      duration: duration ?? this.duration,
      delay: delay ?? this.delay,
      curve: curve ?? this.curve,
      reverseCurve: reverseCurve ?? this.reverseCurve,
      repeat: repeat ?? this.repeat,
      reverse: reverse ?? this.reverse,
    );
  }
}
