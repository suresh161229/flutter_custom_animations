import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/core/config.dart';
import 'package:custom_animation/src/core/handler.dart';
import 'package:custom_animation/src/core/lifecycle.dart';

/// A manager that abstracts away the boilerplate of [AnimationController] creation,
/// delay timers, status handling, and disposal.
class AnimationControllerManager {
  /// The vsync provider used to tick the controller.
  final TickerProvider vsync;

  /// The configuration for the animation.
  final AnimationConfig config;

  /// The optional lifecycle hooks.
  final AnimationLifecycle? lifecycle;

  /// The managed [AnimationController].
  late final AnimationController controller;

  AnimationStatusHandler? _statusHandler;
  Timer? _delayTimer;

  /// Creates an [AnimationControllerManager] and initializes the controller.
  AnimationControllerManager({
    required this.vsync,
    required this.config,
    this.lifecycle,
  }) {
    _initController();
  }

  void _initController() {
    controller = AnimationController(
      vsync: vsync,
      duration: config.duration,
      reverseDuration: config.duration,
    );

    if (lifecycle != null) {
      _statusHandler = AnimationStatusHandler(
        controller: controller,
        lifecycle: lifecycle!,
      );
    }
  }

  /// Starts the animation according to the [config].
  void play() {
    if (config.delay > Duration.zero) {
      _delayTimer = Timer(config.delay, _executePlay);
    } else {
      _executePlay();
    }
  }

  void _executePlay() {
    if (config.repeat) {
      controller.repeat(reverse: config.reverse);
    } else {
      controller.forward();
    }
  }

  /// Safely disposes the controller, timers, and listeners.
  void dispose() {
    _delayTimer?.cancel();
    _statusHandler?.dispose();
    controller.dispose();
  }
}
