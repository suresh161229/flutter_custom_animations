import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/core/core.dart';

/// An animated widget that applies a slide effect to its child.
class SlideAnimation extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The initial offset value (as a fraction of the child's size).
  final Offset begin;

  /// The final offset value (as a fraction of the child's size).
  final Offset end;

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

  /// Creates a [SlideAnimation] with a custom offset range.
  const SlideAnimation({
    super.key,
    required this.child,
    required this.begin,
    this.end = Offset.zero,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  });

  /// Factory for sliding in from the left (-1.0, 0.0) to zero.
  const SlideAnimation.left({
    super.key,
    required this.child,
    this.end = Offset.zero,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  })  : begin = const Offset(-1.0, 0.0);

  /// Factory for sliding in from the right (1.0, 0.0) to zero.
  const SlideAnimation.right({
    super.key,
    required this.child,
    this.end = Offset.zero,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  })  : begin = const Offset(1.0, 0.0);

  /// Factory for sliding in from the top (0.0, -1.0) to zero.
  const SlideAnimation.top({
    super.key,
    required this.child,
    this.end = Offset.zero,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  })  : begin = const Offset(0.0, -1.0);

  /// Factory for sliding in from the bottom (0.0, 1.0) to zero.
  const SlideAnimation.bottom({
    super.key,
    required this.child,
    this.end = Offset.zero,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  })  : begin = const Offset(0.0, 1.0);

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationControllerManager _manager;
  late final Animation<Offset> _offset;

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

    _offset = Tween<Offset>(begin: widget.begin, end: widget.end).animate(
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
    return SlideTransition(
      position: _offset,
      child: widget.child,
    );
  }
}
