import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
import '../utils/demo_scaffold.dart';

class BounceDemo extends StatelessWidget {
  const BounceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Bounce Animation',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DemoBox(
            label: 'Bounce In',
          ).bounce().animate(duration: const Duration(seconds: 1)),

          const SizedBox(height: 40),

          const DemoBox(
            label: 'Elastic',
            color: Colors.indigo,
          ).elastic().animate(duration: const Duration(seconds: 1)),

          const SizedBox(height: 40),

          const DemoBox(label: 'Jelly', color: Colors.cyan).jelly().animate(
            duration: const Duration(milliseconds: 800),
            repeat: true,
            reverse: true,
          ),
        ],
      ),
    );
  }
}
