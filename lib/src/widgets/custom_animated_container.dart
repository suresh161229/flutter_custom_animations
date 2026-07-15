import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// A container that applies a list of effects to its child.
class CustomAnimatedContainer extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final List<AnimationEffect> effects;
  final bool repeat;
  final bool reverse;

  const CustomAnimatedContainer({
    super.key,
    required this.child,
    required this.effects,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.repeat = false,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return ParallelBuilder(
      duration: duration,
      delay: delay,
      repeat: repeat,
      reverse: reverse,
      effects: effects,
      child: child,
    );
  }
}
