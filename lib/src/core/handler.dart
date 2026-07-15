import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/src/core/lifecycle.dart';

/// A utility that listens to an [AnimationController] and triggers
/// the corresponding hooks in an [AnimationLifecycle].
class AnimationStatusHandler {
  /// The [AnimationController] being observed.
  final AnimationController controller;

  /// The [AnimationLifecycle] hooks to trigger.
  final AnimationLifecycle lifecycle;

  /// Creates an [AnimationStatusHandler].
  AnimationStatusHandler({required this.controller, required this.lifecycle}) {
    _initListeners();
  }

  void _initListeners() {
    if (lifecycle.onUpdate != null) {
      controller.addListener(lifecycle.onUpdate!);
    }
    controller.addStatusListener(_handleStatusChange);
  }

  void _handleStatusChange(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        lifecycle.onStart?.call();
        break;
      case AnimationStatus.completed:
        lifecycle.onComplete?.call();
        break;
      case AnimationStatus.dismissed:
        lifecycle.onDismissed?.call();
        break;
    }
  }

  /// Cleans up listeners to prevent memory leaks.
  void dispose() {
    if (lifecycle.onUpdate != null) {
      controller.removeListener(lifecycle.onUpdate!);
    }
    controller.removeStatusListener(_handleStatusChange);
  }
}
