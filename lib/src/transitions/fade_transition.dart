import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// A route that fades in its child.
class FadeRoute<T> extends PageRouteBuilder<T> {
  /// Documentation for [page].
  final Widget page;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a [FadeRoute].
  FadeRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    super.settings,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return const FadeEffect().build(context, child, animation);
         },
       );
}

/// A Navigator 2.0 Page that fades in its child.
class FadePage<T> extends Page<T> {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a [FadePage].
  const FadePage({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return FadeRoute<T>(page: child, duration: duration, settings: this);
  }
}
