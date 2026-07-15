import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/demo_scaffold.dart';

class RotationDemo extends StatelessWidget {
  const RotationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Rotation Animation',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DemoBox(label: 'Spin In')
              .rotate(begin: -0.5, end: 0.0) // half turn
              .scale()
              .fade(),

          const SizedBox(height: 40),

          const DemoBox(label: 'Continuous', color: Colors.teal)
              .rotate(begin: 0.0, end: 1.0)
              .animate(duration: const Duration(seconds: 2), repeat: true),
        ],
      ),
    );
  }
}
