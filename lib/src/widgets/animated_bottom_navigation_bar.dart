import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';

class AnimatedBottomNavItem {
  final IconData icon;
  final String label;
  
  const AnimatedBottomNavItem({required this.icon, required this.label});
}

/// A BottomNavigationBar where selected items perform a custom animation.
class AnimatedBottomNavigationBar extends StatelessWidget {
  final List<AnimatedBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final AnimationEffect activeEffect;

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
      items: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isActive = index == currentIndex;

        return BottomNavigationBarItem(
          icon: isActive
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
