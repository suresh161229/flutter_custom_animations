import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

class AnimatedBottomNavItem {
  /// Documentation for [icon].
  final IconData icon;

  /// Documentation for [label].
  final String label;

  /// Creates a [AnimatedBottomNavItem].
  const AnimatedBottomNavItem({required this.icon, required this.label});
}

/// A BottomNavigationBar where selected items perform a custom animation.
class AnimatedBottomNavigationBar extends StatelessWidget {
  /// Documentation for [items].
  final List<AnimatedBottomNavItem> items;

  /// Documentation for [currentIndex].
  final int currentIndex;

  /// Callback when the widget is tapped.
  final ValueChanged<int> onTap;

  /// Documentation for [activeEffect].
  final AnimationEffect activeEffect;

  /// Creates a [AnimatedBottomNavigationBar].
  const AnimatedBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.activeEffect = const JellyEffect(),
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items:
          items.asMap().entries.map((entry) {
            /// A property of this class.
            final index = entry.key;

            /// A property of this class.
            final item = entry.value;

            /// A property of this class.
            final isActive = index == currentIndex;

            return BottomNavigationBarItem(
              icon:
                  isActive
                      ? EffectBuilder(
                        effect: activeEffect,
                        child: Icon(item.icon),
                      )
                      : Icon(item.icon),
              label: item.label,
            );
          }).toList(),
    );
  }
}
