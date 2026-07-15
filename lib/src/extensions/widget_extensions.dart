import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// An internal wrapper that accumulates effects for a single child widget.
/// When built, it outputs exactly one [ParallelBuilder] (by default), ensuring zero nesting.
class CustomAnimatedWidgetChain extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The list of effects to apply.
  final List<AnimationEffect> effects;

  // Configuration options that might be set at the end of the chain.
  /// The duration of the animation.
  final Duration? duration;

  /// The delay before the animation starts.
  final Duration? delay;

  /// Whether the animation should repeat indefinitely.
  final bool repeat;

  /// Whether the animation should reverse after completing.
  final bool reverse;

  /// Creates a [CustomAnimatedWidgetChain].
  const CustomAnimatedWidgetChain({
    super.key,
    required this.child,
    required this.effects,
    this.duration,
    this.delay,
    this.repeat = false,
    this.reverse = false,
  });

  /// Returns a new instance with the added effect.
  CustomAnimatedWidgetChain addEffect(AnimationEffect effect) {
    return CustomAnimatedWidgetChain(
      effects: [...effects, effect],
      duration: duration,
      delay: delay,
      repeat: repeat,
      reverse: reverse,
      child: child,
    );
  }

  /// Wraps the accumulated effects into a specific builder format.
  Widget buildSequence({Duration? duration, bool? repeat, bool? reverse}) {
    return SequenceBuilder(
      duration: duration ?? this.duration ?? const Duration(milliseconds: 500),
      repeat: repeat ?? this.repeat,
      effects: effects,
      child: child,
    );
  }

  /// Creates a [Stagger].
  Widget buildStagger({
    required double staggerRatio,
    Duration? duration,
    bool? repeat,
    bool? reverse,
  }) {
    return StaggerBuilder(
      duration: duration ?? this.duration ?? const Duration(milliseconds: 500),
      staggerRatio: staggerRatio,
      repeat: repeat ?? this.repeat,
      effects: effects,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ParallelBuilder(
      duration: duration ?? const Duration(milliseconds: 500),
      delay: delay ?? Duration.zero,
      repeat: repeat,
      reverse: reverse,
      effects: effects,
      child: child,
    );
  }
}

/// Fluent API extensions on [Widget] for adding animation effects with zero nesting.
extension CustomAnimationWidgetExtensions on Widget {
  CustomAnimatedWidgetChain _getChain() {
    if (this is CustomAnimatedWidgetChain) {
      return this as CustomAnimatedWidgetChain;
    }
    return CustomAnimatedWidgetChain(effects: const [], child: this);
  }

  /// Applies a fade effect to the widget.
  CustomAnimatedWidgetChain fade({double begin = 0.0, double end = 1.0}) {
    return _getChain().addEffect(FadeEffect(begin: begin, end: end));
  }

  /// Applies a scale effect to the widget.
  CustomAnimatedWidgetChain scale({double begin = 0.0, double end = 1.0}) {
    return _getChain().addEffect(ScaleEffect(begin: begin, end: end));
  }

  /// Applies a slide effect to the widget.
  CustomAnimatedWidgetChain slide({
    Offset begin = const Offset(-1.0, 0.0),
    Offset end = Offset.zero,
  }) {
    return _getChain().addEffect(SlideEffect(begin: begin, end: end));
  }

  /// Applies a rotation effect to the widget.
  CustomAnimatedWidgetChain rotate({double begin = 0.0, double end = 1.0}) {
    return _getChain().addEffect(RotationEffect(begin: begin, end: end));
  }

  /// Applies a blur effect to the widget.
  CustomAnimatedWidgetChain blur({double begin = 10.0, double end = 0.0}) {
    return _getChain().addEffect(BlurEffect(begin: begin, end: end));
  }

  /// Applies a zoom effect to the widget.
  CustomAnimatedWidgetChain zoom({double begin = 0.0, double end = 1.0}) {
    return _getChain().addEffect(ZoomEffect(begin: begin, end: end));
  }

  /// Applies a bounce effect to the widget.
  CustomAnimatedWidgetChain bounce() {
    return _getChain().addEffect(const BounceEffect());
  }

  /// Applies a shake effect to the widget.
  CustomAnimatedWidgetChain shake() {
    return _getChain().addEffect(const ShakeEffect());
  }

  /// Applies a 3D flip effect to the widget.
  CustomAnimatedWidgetChain flip() {
    return _getChain().addEffect(const FlipEffect());
  }

  /// Applies a pulse effect to the widget.
  CustomAnimatedWidgetChain pulse() {
    return _getChain().addEffect(const PulseEffect());
  }

  /// Applies an elastic scale effect to the widget.
  CustomAnimatedWidgetChain elastic() {
    return _getChain().addEffect(const ElasticEffect());
  }

  /// Applies a swing rotation effect to the widget.
  CustomAnimatedWidgetChain swing() {
    return _getChain().addEffect(const SwingEffect());
  }

  /// Applies a jelly squash-and-stretch effect to the widget.
  CustomAnimatedWidgetChain jelly() {
    return _getChain().addEffect(const JellyEffect());
  }

  /// Replaces the default ParallelBuilder with a SequenceBuilder for all collected effects.
  Widget sequence({
    Duration? duration,
    bool repeat = false,
    bool reverse = false,
  }) {
    return _getChain().buildSequence(
      duration: duration,
      repeat: repeat,
      reverse: reverse,
    );
  }

  /// Alias for sequence(). Chains all effects to run sequentially.
  Widget chain({
    Duration? duration,
    bool repeat = false,
    bool reverse = false,
  }) {
    return sequence(duration: duration, repeat: repeat, reverse: reverse);
  }

  /// Replaces the default ParallelBuilder with a StaggerBuilder for all collected effects.
  Widget stagger({
    double staggerRatio = 0.2,
    Duration? duration,
    bool repeat = false,
    bool reverse = false,
  }) {
    return _getChain().buildStagger(
      staggerRatio: staggerRatio,
      duration: duration,
      repeat: repeat,
      reverse: reverse,
    );
  }

  /// Applies general configuration to the underlying builder.
  CustomAnimatedWidgetChain animate({
    Duration? duration,
    Duration? delay,
    bool repeat = false,
    bool reverse = false,
  }) {
    /// A property of this class.
    final chain = _getChain();
    return CustomAnimatedWidgetChain(
      effects: chain.effects,
      duration: duration ?? chain.duration,
      delay: delay ?? chain.delay,
      repeat: repeat,
      reverse: reverse,
      child: chain.child,
    );
  }
}
