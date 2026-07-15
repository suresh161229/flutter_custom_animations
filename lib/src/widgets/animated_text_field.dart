import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated text field that gently fades and scales in.
class AnimatedTextField extends StatelessWidget {
  /// Documentation for [controller].
  final TextEditingController? controller;

  /// Documentation for [hintText].
  final String? hintText;

  /// Documentation for [prefixIcon].
  final Widget? prefixIcon;

  /// Documentation for [suffixIcon].
  final Widget? suffixIcon;

  /// Documentation for [obscureText].
  final bool obscureText;

  /// Documentation for [onChanged].
  final ValueChanged<String>? onChanged;

  /// The duration of the animation.
  final Duration duration;

  /// The effect to apply.
  final AnimationEffect effect;

  /// Creates a [AnimatedTextField].
  const AnimatedTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.duration = const Duration(milliseconds: 400),
    this.effect = const ZoomEffect(begin: 0.95, end: 1.0),
  });

  @override
  Widget build(BuildContext context) {
    return ParallelBuilder(
      duration: duration,
      effects: [effect, const FadeEffect()],
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
