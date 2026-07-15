import 'package:flutter/widgets.dart';
import 'package:custom_animation/src/core/core.dart';

/// A widget builder that receives the current [Animation] frame.
typedef CustomAnimationWidgetBuilder = Widget Function(
  BuildContext context,
  Widget child,
  Animation<double> animation,
);

/// A stateful builder that encapsulates [AnimationControllerManager] to easily 
/// build custom animations without duplicating controller logic.
class CustomAnimationBuilder extends StatefulWidget {
  /// The widget below this widget in the tree.
  final Widget child;

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

  /// The builder that is called every time the animation ticks.
  final CustomAnimationWidgetBuilder builder;

  /// Creates a [CustomAnimationBuilder].
  const CustomAnimationBuilder({
    super.key,
    required this.child,
    required this.builder,
    this.duration,
    this.delay,
    this.curve,
    this.repeat = false,
    this.reverse = false,
    this.autoPlay = true,
    this.onStart,
    this.onComplete,
  });

  @override
  State<CustomAnimationBuilder> createState() => _CustomAnimationBuilderState();
}

class _CustomAnimationBuilderState extends State<CustomAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationControllerManager _manager;
  late final Animation<double> _animation;

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

    _animation = CurvedAnimation(
      parent: _manager.controller,
      curve: _manager.config.curve,
      reverseCurve: _manager.config.reverseCurve,
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => widget.builder(context, child!, _animation),
      child: widget.child,
    );
  }
}
