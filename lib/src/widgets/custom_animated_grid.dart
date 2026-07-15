import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// A drop-in replacement for GridView.builder with staggered entrance animations.
class CustomAnimatedGrid extends StatelessWidget {
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final SliverGridDelegate gridDelegate;
  final Duration duration;
  final Duration staggerDuration;
  final List<AnimationEffect> effects;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final int maxStaggerDepth;

  const CustomAnimatedGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.gridDelegate,
    this.duration = const Duration(milliseconds: 500),
    this.staggerDuration = const Duration(milliseconds: 50),
    this.maxStaggerDepth = 40,
    this.effects = const [
      FadeEffect(),
      ScaleEffect(begin: 0.8, end: 1.0),
    ],
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
        final child = itemBuilder(context, index);
        if (child == null) return const SizedBox.shrink();

        // Stagger up to maxStaggerDepth items, after that load instantly
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
