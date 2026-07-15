import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// Displays a custom animated dialog overlay.
Future<T?> showAnimatedDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Duration duration = const Duration(milliseconds: 300),
  List<AnimationEffect> effects = const [
    ZoomEffect(begin: 0.8, end: 1.0),
    FadeEffect(),
  ],
  Color barrierColor = const Color(0x80000000),
  bool barrierDismissible = true,
  String? barrierLabel,
}) {
  return showGeneralDialog<T>(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return builder(context);
    },
    transitionDuration: duration,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Widget result = child;
      for (final effect in effects) {
        result = effect.build(context, result, animation);
      }
      return result;
    },
  );
}
