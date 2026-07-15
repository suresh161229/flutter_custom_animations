import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';

/// A route that scales up its child.
class ScaleRoute<T> extends PageRouteBuilder<T> {
  /// Documentation for [page].
  final Widget page;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a [ScaleRoute].
  ScaleRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    super.settings,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return const ScaleEffect(
             begin: 0.0,
           ).build(context, child, animation);
         },
       );
}

/// A Navigator 2.0 Page that scales up its child.
class ScalePage<T> extends Page<T> {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a [ScalePage].
  const ScalePage({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ScaleRoute<T>(page: child, duration: duration, settings: this);
  }
}
