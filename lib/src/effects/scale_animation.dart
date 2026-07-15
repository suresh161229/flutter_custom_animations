import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/core/core.dart';

/// An animated widget that applies a scale effect to its child.
class ScaleAnimation extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The initial scale value.
  final double begin;

  /// The final scale value.
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

  /// Creates a [ScaleAnimation] widget with a custom scale range.
  const ScaleAnimation({
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

  /// Factory for a scale up animation (0.0 to 1.0).
  const ScaleAnimation.scaleUp({
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

  /// Factory for a scale down animation (1.0 to 0.0).
  const ScaleAnimation.scaleDown({
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
  }) : begin = 1.0,
       end = 0.0;

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationControllerManager _manager;
  late final Animation<double> _scale;

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

    _scale = Tween<double>(begin: widget.begin, end: widget.end).animate(
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
    return ScaleTransition(scale: _scale, child: widget.child);
  }
}
