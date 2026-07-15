import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated text field that gently fades and scales in.
class AnimatedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Duration duration;
  final AnimationEffect effect;

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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
