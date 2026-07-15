import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/core/core.dart';

/// An animated widget that applies a fade effect to its child.
class FadeAnimation extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The initial opacity value.
  final double begin;

  /// The final opacity value.
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

  /// Creates a [FadeAnimation] widget.
  const FadeAnimation({
    super.key,
    required this.child,
    this.begin = 0.0,
    this.end = 1.0,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  });

  /// Factory for a standard fade in animation (0.0 to 1.0).
  const FadeAnimation.fadeIn({
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

  /// Factory for a standard fade out animation (1.0 to 0.0).
  const FadeAnimation.fadeOut({
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
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationControllerManager _manager;
  late final Animation<double> _opacity;

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

    _opacity = Tween<double>(begin: widget.begin, end: widget.end).animate(
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
    return FadeTransition(opacity: _opacity, child: widget.child);
  }
}
