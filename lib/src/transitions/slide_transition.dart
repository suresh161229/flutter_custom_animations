import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';

/// A route that slides in its child.
class SlideRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration duration;
  final Offset begin;

  SlideRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    this.begin = const Offset(1.0, 0.0),
    super.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideEffect(begin: begin).build(context, child, animation);
          },
        );
}

/// A Navigator 2.0 Page that slides in its child.
class SlidePage<T> extends Page<T> {
  final Widget child;
  final Duration duration;
  final Offset begin;

  const SlidePage({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.begin = const Offset(1.0, 0.0),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return SlideRoute<T>(
      page: child,
      duration: duration,
      begin: begin,
      settings: this,
    );
  }
}
