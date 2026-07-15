import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated text widget that applies effects to the text.
class AnimatedText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Duration duration;
  final AnimationEffect effect;

  const AnimatedText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.duration = const Duration(milliseconds: 500),
    this.effect = const FadeEffect(),
  });

  @override
  Widget build(BuildContext context) {
    return ParallelBuilder(
      duration: duration,
      effects: [effect],
      child: Text(
        data,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
