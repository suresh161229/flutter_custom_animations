import 'package:flutter/material.dart';

/// A route optimized for Hero transitions.
class HeroRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration duration;

  HeroRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 400),
    super.settings,
  }) : super(
          opaque: false, // Ensures previous route is visible during flight
          barrierColor: Colors.black.withValues(alpha: 0.5),
          barrierDismissible: true,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

/// A Navigator 2.0 Page optimized for Hero transitions.
class HeroPage<T> extends Page<T> {
  final Widget child;
  final Duration duration;

  const HeroPage({
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return HeroRoute<T>(
      page: child,
      duration: duration,
      settings: this,
    );
  }
}
