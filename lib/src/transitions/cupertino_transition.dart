import 'package:flutter/cupertino.dart';

/// A wrapper around CupertinoPageRoute.
class CupertinoRoute<T> extends CupertinoPageRoute<T> {
  CupertinoRoute({
    required Widget page,
    super.settings,
  }) : super(builder: (context) => page);
}

/// A Navigator 2.0 Page that implements Cupertino transition.
class CupertinoPage<T> extends Page<T> {
  final Widget child;

  const CupertinoPage({
    required this.child,
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoRoute<T>(
      page: child,
      settings: this,
    );
  }
}
