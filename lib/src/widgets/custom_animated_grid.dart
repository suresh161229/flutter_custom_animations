import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// A drop-in replacement for GridView.builder with staggered entrance animations.
class CustomAnimatedGrid extends StatelessWidget {
  /// The total number of items.
  final int itemCount;

  /// The builder function for children items.
  final NullableIndexedWidgetBuilder itemBuilder;

  /// Controls the layout of tiles in a grid.
  final SliverGridDelegate gridDelegate;

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

  /// Creates a [CustomAnimatedGrid].
  const CustomAnimatedGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.gridDelegate,
    this.duration = const Duration(milliseconds: 500),
    this.staggerDuration = const Duration(milliseconds: 50),
    this.maxStaggerDepth = 40,
    this.effects = const [FadeEffect(), ScaleEffect(begin: 0.8, end: 1.0)],
    this.controller,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: gridDelegate,
      padding: padding,
      itemCount: itemCount,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      itemBuilder: (context, index) {
        /// The widget below this widget in the tree.
        final child = itemBuilder(context, index);
        if (child == null) return const SizedBox.shrink();

        // Stagger up to maxStaggerDepth items, after that load instantly
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
