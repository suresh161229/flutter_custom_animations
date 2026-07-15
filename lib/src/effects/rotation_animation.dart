import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/core/core.dart';

/// An animated widget that applies a rotation effect to its child.
class RotationAnimation extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The initial rotation value (1.0 = one full rotation).
  final double begin;

  /// The final rotation value (1.0 = one full rotation).
  final double end;

  /// The duration of the animation.
  final Duration? duration;

  /// The delay before the animation starts.
  final Duration? delay;

  /// The curve used for the animation.
  final Curve? curve;

  /// Whether the animation should repeat.
  final bool repeat;

  /// Whether the animation should reverse after completing.
  final bool reverse;

  /// Whether the animation should start automatically.
  final bool autoPlay;

  /// Callback when the animation starts.
  final VoidCallback? onStart;

  /// Callback when the animation completes.
  final VoidCallback? onComplete;

  /// Creates a [RotationAnimation] widget with a custom rotation range.
  const RotationAnimation({
    super.key,
    required this.child,
    required this.begin,
    required this.end,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  });

  /// Factory for a clockwise rotation animation (0.0 to 1.0).
  const RotationAnimation.clockwise({
    super.key,
    required this.child,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  }) : begin = 0.0,
       end = 1.0;

  /// Factory for an anti-clockwise rotation animation (0.0 to -1.0).
  const RotationAnimation.antiClockwise({
    super.key,
    required this.child,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  }) : begin = 0.0,
       end = -1.0;

  /// Factory for a continuous, infinite rotation (defaults to linear curve and repeat: true).
  const RotationAnimation.continuous({
    super.key,
    required this.child,
    this.duration,
    this.delay,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  }) : begin = 0.0,
       end = 1.0,
       repeat = true,
       curve = Curves.linear;

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationControllerManager _manager;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _manager = AnimationControllerManager(
      vsync: this,
      config: AnimationConfig(
        duration: widget.duration ?? AnimationDuration.normal,
        delay: widget.delay ?? AnimationConstants.defaultDelay,
        curve: widget.curve ?? AnimationCurves.defaultIn,
        repeat: widget.repeat,
        reverse: widget.reverse,
      ),
      lifecycle: AnimationLifecycle(
        onStart: widget.onStart,
        onComplete: widget.onComplete,
      ),
    );

    _rotation = Tween<double>(begin: widget.begin, end: widget.end).animate(
      CurvedAnimation(
        parent: _manager.controller,
        curve: _manager.config.curve,
        reverseCurve: _manager.config.reverseCurve,
      ),
    );

    if (widget.autoPlay) {
      _manager.play();
    }
  }

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _rotation, child: widget.child);
  }
}
