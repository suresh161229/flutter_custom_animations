import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// A card that elegantly enters the screen when built.
class AnimatedCard extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The delay before the animation starts.
  final Duration delay;

  /// The duration of the animation.
  final Duration duration;

  /// Documentation for [entryEffects].
  final List<AnimationEffect> entryEffects;

  /// Creates a [AnimatedCard].
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
