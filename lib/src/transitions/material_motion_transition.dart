import 'package:flutter/material.dart';

/// A route that implements the Material Fade Through pattern.
class MaterialMotionRoute<T> extends PageRouteBuilder<T> {
  /// Documentation for [page].
  final Widget page;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a [MaterialMotionRoute].
  MaterialMotionRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    super.settings,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return AnimatedBuilder(
             animation: Listenable.merge([animation, secondaryAnimation]),
             builder: (context, _) {
               final fadeOut = Tween<double>(begin: 1.0, end: 0.0).animate(
                 CurvedAnimation(
                   parent: secondaryAnimation,
                   curve: const Interval(0.0, 0.3),
                 ),
               );

               final fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
                 CurvedAnimation(
                   parent: animation,
                   curve: const Interval(0.3, 1.0),
                 ),
               );

               final scaleIn = Tween<double>(begin: 0.92, end: 1.0).animate(
                 CurvedAnimation(
                   parent: animation,
                   curve: const Interval(0.3, 1.0),
                 ),
               );

               return Opacity(
                 opacity: (fadeIn.value * fadeOut.value).clamp(0.0, 1.0),
                 child: Transform.scale(scale: scaleIn.value, child: child),
               );
             },
           );
         },
       );
}

/// A Navigator 2.0 Page that implements Material Motion Fade Through.
class MaterialMotionPage<T> extends Page<T> {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a [MaterialMotionPage].
  const MaterialMotionPage({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialMotionRoute<T>(
      page: child,
      duration: duration,
      settings: this,
    );
  }
}
