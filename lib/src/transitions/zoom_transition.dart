import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';

/// A route that zooms (scales + fades) in its child.
class ZoomRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration duration;

  ZoomRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    super.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return const ZoomEffect(begin: 0.0).build(context, child, animation);
          },
        );
}

/// A Navigator 2.0 Page that zooms in its child.
class ZoomPage<T> extends Page<T> {
  final Widget child;
  final Duration duration;

  const ZoomPage({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ZoomRoute<T>(
      page: child,
      duration: duration,
      settings: this,
    );
  }
}
