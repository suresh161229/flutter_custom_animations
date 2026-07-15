import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';

/// A drawer that applies a 3D flip effect as it is built by the scaffold.
class AnimatedDrawer extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const AnimatedDrawer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: EffectBuilder(
        effect: const FlipEffect(),
        duration: duration,
        child: child,
      ),
    );
  }
}
