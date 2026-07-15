import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
import '../utils/demo_scaffold.dart';

class FlipDemo extends StatelessWidget {
  const FlipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Flip Animation',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DemoBox(
            label: 'Flip In',
          ).flip().animate(duration: const Duration(seconds: 1)),

          const SizedBox(height: 40),

          const DemoBox(
            label: 'Continuous',
            color: Colors.deepOrange,
          ).flip().animate(duration: const Duration(seconds: 2), repeat: true),
        ],
      ),
    );
  }
}
