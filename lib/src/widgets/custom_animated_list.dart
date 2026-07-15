import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// A drop-in replacement for ListView.builder with staggered entrance animations.
class CustomAnimatedList extends StatelessWidget {
  /// The total number of items.
  final int itemCount;

  /// The builder function for children items.
  final NullableIndexedWidgetBuilder itemBuilder;

  /// The duration of the animation.
  final Duration duration;

  /// The duration to stagger children animations.
  final Duration staggerDuration;

  /// The list of effects to apply.
  final List<AnimationEffect> effects;

  /// Documentation for [controller].
  final ScrollController? controller;

  /// Empty space to inscribe inside the widget.
  final EdgeInsetsGeometry? padding;

  /// Documentation for [scrollDirection].
  final Axis scrollDirection;

  /// Documentation for [shrinkWrap].
  final bool shrinkWrap;

  /// Documentation for [maxStaggerDepth].
  final int maxStaggerDepth;

  /// Creates a [CustomAnimatedList].
  const CustomAnimatedList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.duration = const Duration(milliseconds: 500),
    this.staggerDuration = const Duration(milliseconds: 100),
    this.maxStaggerDepth = 20,
    this.effects = const [
      FadeEffect(),
      SlideEffect(begin: Offset(0, 0.2), end: Offset.zero),
    ],
    this.controller,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: padding,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      itemBuilder: (context, index) {
        /// The widget below this widget in the tree.
        final child = itemBuilder(context, index);
        if (child == null) return const SizedBox.shrink();

        // Stagger up to maxStaggerDepth items, after that load them instantly to avoid infinite delays when scrolling.
        /// A property of this class.
        final delayMs =
            index < maxStaggerDepth
                ? staggerDuration.inMilliseconds * index
                : 0;

        return ParallelBuilder(
          duration: duration,
          delay: Duration(milliseconds: delayMs),
          effects: effects,
          child: child,
        );
      },
    );
  }
}
