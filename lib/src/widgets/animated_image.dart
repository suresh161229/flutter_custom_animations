import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated image widget that fades in when displayed.
class AnimatedImage extends StatelessWidget {
  /// Documentation for [image].
  final ImageProvider image;

  /// Documentation for [fit].
  final BoxFit? fit;

  /// Documentation for [width].
  final double? width;

  /// Documentation for [height].
  final double? height;

  /// The duration of the animation.
  final Duration duration;

  /// The effect to apply.
  final AnimationEffect effect;

  /// Creates a [AnimatedImage].
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
      child: Image(image: image, fit: fit, width: width, height: height),
    );
  }
}
