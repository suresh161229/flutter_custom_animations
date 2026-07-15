import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated image widget that fades in when displayed.
class AnimatedImage extends StatelessWidget {
  final ImageProvider image;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Duration duration;
  final AnimationEffect effect;

  const AnimatedImage({
    super.key,
    required this.image,
    this.fit,
    this.width,
    this.height,
    this.duration = const Duration(milliseconds: 600),
    this.effect = const FadeEffect(),
  });

  @override
  Widget build(BuildContext context) {
    return ParallelBuilder(
      duration: duration,
      effects: [effect],
      child: Image(
        image: image,
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
