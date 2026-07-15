import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

/// An animated search bar that expands horizontally.
class AnimatedSearchBar extends StatefulWidget {
  /// Documentation for [controller].
  final TextEditingController controller;

  /// Documentation for [onChanged].
  final ValueChanged<String>? onChanged;

  /// Documentation for [onSubmitted].
  final VoidCallback? onSubmitted;

  /// Documentation for [collapsedWidth].
  final double collapsedWidth;

  /// Documentation for [expandedWidth].
  final double expandedWidth;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a [AnimatedSearchBar].
  const AnimatedSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.collapsedWidth = 50.0,
    this.expandedWidth = 300.0,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationControllerManager _manager;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _manager = AnimationControllerManager(
      vsync: this,
      config: AnimationConfig(
        duration: widget.duration,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _manager.controller.forward();
      } else {
        FocusScope.of(context).unfocus();
        _manager.controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _manager.controller,
      builder: (context, child) {
        /// A property of this class.
        final width =
            widget.collapsedWidth +
            (widget.expandedWidth - widget.collapsedWidth) *
                _manager.controller.value;
        return Container(
          width: width,
          height: widget.collapsedWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(widget.collapsedWidth / 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: _toggle,
                behavior: HitTestBehavior.opaque,
                child: SizedBox(
                  width: widget.collapsedWidth,
                  height: widget.collapsedWidth,
                  child: const Icon(Icons.search),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: _manager.controller.value,
                  child:
                      _isExpanded
                          ? TextField(
                            controller: widget.controller,
                            onChanged: widget.onChanged,
                            onSubmitted: (_) {
                              if (widget.onSubmitted != null) {
                                widget.onSubmitted!();
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search...',
                            ),
                          )
                          : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
