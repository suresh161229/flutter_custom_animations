import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/demo_scaffold.dart';

class FadeDemo extends StatelessWidget {
  const FadeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Fade Animation',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Fade In',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const DemoBox(label: 'Fade')
              .fade(begin: 0.0, end: 1.0)
              .animate(duration: const Duration(seconds: 1)),

          const SizedBox(height: 40),

          const Text(
            'Fade Out (Delayed)',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const DemoBox(label: 'Gone!', color: Colors.pink)
              .fade(begin: 1.0, end: 0.0)
              .animate(
                duration: const Duration(seconds: 1),
                delay: const Duration(milliseconds: 500),
              ),
        ],
      ),
    );
  }
}
