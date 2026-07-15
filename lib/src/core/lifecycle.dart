import 'package:flutter/widgets.dart';

/// A container class for animation lifecycle callbacks.
@immutable
class AnimationLifecycle {
  /// Called when the animation starts (forward or reverse).
  final VoidCallback? onStart;

  /// Called when the animation completes its forward pass.
  final VoidCallback? onComplete;

  /// Called when the animation completes its reverse pass (returns to start).
  final VoidCallback? onDismissed;

  /// Called every time the animation updates.
  final VoidCallback? onUpdate;

  /// Creates an [AnimationLifecycle] with optional callbacks.
  const AnimationLifecycle({
    this.onStart,
    this.onComplete,
    this.onDismissed,
    this.onUpdate,
  });
}
