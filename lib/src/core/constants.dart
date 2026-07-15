import 'package:flutter/widgets.dart';

/// Defines standardized animation constants used throughout the framework.
class AnimationConstants {
  /// Default repeat count if repetition is enabled.
  static const int defaultRepeatCount = 1;

  /// Default delay before an animation starts.
  static const Duration defaultDelay = Duration.zero;
}

/// Defines standardized duration presets for animations.
class AnimationDuration {
  /// Fast duration (200ms).
  static const Duration fast = Duration(milliseconds: 200);

  /// Normal duration (350ms).
  static const Duration normal = Duration(milliseconds: 350);

  /// Slow duration (800ms).
  static const Duration slow = Duration(milliseconds: 800);
}

/// Defines standardized curves for animations.
class AnimationCurves {
  /// Default curve for animations coming in (easeOut).
  static const Curve defaultIn = Curves.easeOut;

  /// Default curve for animations going out (easeIn).
  static const Curve defaultOut = Curves.easeIn;

  /// A bouncy curve for playful animations.
  static const Curve bouncy = Curves.elasticOut;
}
