import 'package:flutter/material.dart';

enum SharedAxis { x, y, z }

/// A route that implements the Material Shared Axis transition pattern.
class SharedAxisRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final SharedAxis type;
  final Duration duration;

  SharedAxisRoute({
    required this.page,
    this.type = SharedAxis.x,
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
                final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: const Interval(0.5, 1.0)),
                );
                final secondaryFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
                  CurvedAnimation(parent: secondaryAnimation, curve: const Interval(0.0, 0.5)),
                );

                Widget animatedChild = child;
                if (type == SharedAxis.x) {
                  final slideIn = Tween<Offset>(begin: const Offset(0.05, 0.0), end: Offset.zero).animate(animation);
                  final slideOut = Tween<Offset>(begin: Offset.zero, end: const Offset(-0.05, 0.0)).animate(secondaryAnimation);
                  animatedChild = FractionalTranslation(
                    translation: slideIn.value + slideOut.value,
                    child: child,
                  );
                } else if (type == SharedAxis.y) {
                  final slideIn = Tween<Offset>(begin: const Offset(0.0, 0.05), end: Offset.zero).animate(animation);
                  final slideOut = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -0.05)).animate(secondaryAnimation);
                  animatedChild = FractionalTranslation(
                    translation: slideIn.value + slideOut.value,
                    child: child,
                  );
                } else if (type == SharedAxis.z) {
                  final scaleIn = Tween<double>(begin: 0.8, end: 1.0).animate(animation);
                  final scaleOut = Tween<double>(begin: 1.0, end: 1.2).animate(secondaryAnimation);
                  animatedChild = Transform.scale(
                    scale: scaleIn.value * scaleOut.value,
                    child: child,
                  );
                }

                return Opacity(
                  opacity: (fadeAnimation.value * secondaryFadeAnimation.value).clamp(0.0, 1.0),
                  child: animatedChild,
                );
              },
            );
          },
        );
}

/// A Navigator 2.0 Page that implements Shared Axis transition.
class SharedAxisPage<T> extends Page<T> {
  final Widget child;
  final SharedAxis type;
  final Duration duration;

  const SharedAxisPage({
    required this.child,
    this.type = SharedAxis.x,
    this.duration = const Duration(milliseconds: 300),
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return SharedAxisRoute<T>(
      page: child,
      type: type,
      duration: duration,
      settings: this,
    );
  }
}
