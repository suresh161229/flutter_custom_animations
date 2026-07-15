import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// A drop-in replacement for ListView.builder with staggered entrance animations.
class CustomAnimatedList extends StatelessWidget {
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final Duration staggerDuration;
  final List<AnimationEffect> effects;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final int maxStaggerDepth;

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
        final child = itemBuilder(context, index);
        if (child == null) return const SizedBox.shrink();

        // Stagger up to maxStaggerDepth items, after that load them instantly to avoid infinite delays when scrolling.
        final delayMs = index < maxStaggerDepth ? staggerDuration.inMilliseconds * index : 0;
        
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
