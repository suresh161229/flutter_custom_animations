import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// A card that elegantly enters the screen when built.
class AnimatedCard extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final List<AnimationEffect> entryEffects;

  const AnimatedCard({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 500),
    this.entryEffects = const [
      FadeEffect(),
      SlideEffect(begin: Offset(0, 0.2), end: Offset.zero),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return ParallelBuilder(
      delay: delay,
      duration: duration,
      effects: entryEffects,
      child: child,
    );
  }
}
