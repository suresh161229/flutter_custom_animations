import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated Floating Action Button with resting idle animations.
class AnimatedFAB extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final AnimationEffect idleEffect;
  final AnimationEffect pressEffect;

  const AnimatedFAB({
    super.key,
    required this.child,
    this.onPressed,
    this.idleEffect = const PulseEffect(),
    this.pressEffect = const ScaleEffect(begin: 1.0, end: 0.8),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: onPressed,
      effect: pressEffect,
      child: EffectBuilder(
        effect: idleEffect,
        repeat: true,
        reverse: true,
        duration: const Duration(seconds: 1),
        child: child,
      ),
    );
  }
}
