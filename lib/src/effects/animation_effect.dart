import 'package:flutter/widgets.dart';
import 'dart:ui' show ImageFilter;
import 'dart:math' as math;

/// The base contract for all animation effects used within combined builders.
abstract class AnimationEffect {
  const AnimationEffect();

  /// Builds the effect's widget (Transform, Opacity, etc.) wrapping the [child].
  Widget build(BuildContext context, Widget child, Animation<double> animation);
}

/// A fade effect.
class FadeEffect extends AnimationEffect {
  /// The starting value for this animation.
  final double begin;

  /// The final value for this animation.
  final double end;

  /// Creates a [FadeEffect].
  const FadeEffect({this.begin = 0.0, this.end = 1.0});

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    return Opacity(
      opacity: begin + (end - begin) * animation.value,
      child: child,
    );
  }
}

/// A scale effect.
class ScaleEffect extends AnimationEffect {
  /// The starting value for this animation.
  final double begin;

  /// The final value for this animation.
  final double end;

  /// Creates a [ScaleEffect].
  const ScaleEffect({this.begin = 0.0, this.end = 1.0});

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    return Transform.scale(
      scale: begin + (end - begin) * animation.value,
      child: child,
    );
  }
}

/// A slide effect.
class SlideEffect extends AnimationEffect {
  /// The starting value for this animation.
  final Offset begin;

  /// The final value for this animation.
  final Offset end;

  /// Creates a [SlideEffect].
  const SlideEffect({
    this.begin = const Offset(-1.0, 0.0),
    this.end = Offset.zero,
  });

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    return FractionalTranslation(
      translation: Offset.lerp(begin, end, animation.value)!,
      child: child,
    );
  }
}

/// A rotation effect.
class RotationEffect extends AnimationEffect {
  /// The starting value for this animation.
  final double begin;

  /// The final value for this animation.
  final double end;

  /// Creates a [RotationEffect].
  const RotationEffect({this.begin = 0.0, this.end = 1.0}); // Turns

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    return Transform.rotate(
      angle: (begin + (end - begin) * animation.value) * 2.0 * math.pi,
      child: child,
    );
  }
}

/// A blur effect.
class BlurEffect extends AnimationEffect {
  /// The starting value for this animation.
  final double begin;

  /// The final value for this animation.
  final double end;

  /// Creates a [BlurEffect].
  const BlurEffect({this.begin = 10.0, this.end = 0.0});

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    /// A property of this class.
    final sigma = begin + (end - begin) * animation.value;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: child,
    );
  }
}

/// A zoom effect (scale + fade).
class ZoomEffect extends AnimationEffect {
  /// The starting value for this animation.
  final double begin;

  /// The final value for this animation.
  final double end;

  /// Creates a [ZoomEffect].
  const ZoomEffect({this.begin = 0.0, this.end = 1.0});

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    /// A property of this class.
    final val = begin + (end - begin) * animation.value;
    return Opacity(
      opacity: val.clamp(0.0, 1.0),
      child: Transform.scale(scale: val, child: child),
    );
  }
}

/// A bounce effect (translation Y dampened sine).
class BounceEffect extends AnimationEffect {
  const BounceEffect();

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    /// A property of this class.
    final val = animation.value;

    /// A property of this class.
    final dy = -math.sin(val * math.pi) * math.cos(val * math.pi * 2) * 20.0;
    return Transform.translate(offset: Offset(0, dy), child: child);
  }
}

/// A shake effect (translation X sine).
class ShakeEffect extends AnimationEffect {
  const ShakeEffect();

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    /// A property of this class.
    final dx = math.sin(animation.value * math.pi * 6) * 10;
    return Transform.translate(offset: Offset(dx, 0), child: child);
  }
}

/// A 3D flip effect.
class FlipEffect extends AnimationEffect {
  const FlipEffect();

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(animation.value * math.pi),
      child: child,
    );
  }
}

/// An elastic effect.
class ElasticEffect extends AnimationEffect {
  const ElasticEffect();

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    return Transform.scale(scale: animation.value, child: child);
  }
}

/// A swing effect.
class SwingEffect extends AnimationEffect {
  const SwingEffect();

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    final angle =
        math.sin(animation.value * math.pi * 3) *
        math.cos(animation.value * math.pi / 2) *
        0.3;
    return Transform.rotate(
      angle: angle,
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}

/// A jelly squash-and-stretch effect.
class JellyEffect extends AnimationEffect {
  const JellyEffect();

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    /// A property of this class.
    final val = animation.value;
    final x =
        1.0 + math.sin(val * math.pi * 3) * math.cos(val * math.pi / 2) * 0.25;
    final y =
        1.0 - math.sin(val * math.pi * 3) * math.cos(val * math.pi / 2) * 0.25;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(x, y, 1.0),
      child: child,
    );
  }
}

/// A pulse effect.
class PulseEffect extends AnimationEffect {
  const PulseEffect();

  @override
  Widget build(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    /// A property of this class.
    final scale = 1.0 + (math.sin(animation.value * math.pi) * 0.1);
    return Transform.scale(scale: scale, child: child);
  }
}
