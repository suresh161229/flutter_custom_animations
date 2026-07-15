import 'package:flutter/widgets.dart';
import 'package:custom_animation/custom_animation.dart';

/// An animated button that scales or bounces dynamically on tap.
class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final AnimationEffect effect;
  final Duration duration;

  const AnimatedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.effect = const ScaleEffect(begin: 1.0, end: 0.9),
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationControllerManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = AnimationControllerManager(
      vsync: this,
      config: AnimationConfig(duration: widget.duration),
    );
  }

  @override
  void didUpdateWidget(AnimatedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _manager.controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onPressed != null) {
      _manager.controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onPressed != null) {
      _manager.controller.reverse();
      widget.onPressed!();
    }
  }

  void _onTapCancel() {
    if (widget.onPressed != null) {
      _manager.controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _manager.controller,
        builder: (context, child) {
          return widget.effect.build(context, child!, _manager.controller);
        },
        child: widget.child,
      ),
    );
  }
}
