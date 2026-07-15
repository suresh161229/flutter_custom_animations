import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
import '../utils/demo_scaffold.dart';

class ScaleDemo extends StatelessWidget {
  const ScaleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Scale Animation',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DemoBox(label: 'Scale Up').scale(begin: 0.0, end: 1.0),

          const SizedBox(height: 40),

          const DemoBox(
            label: 'Pulse',
            color: Colors.purple,
          ).scale(begin: 1.0, end: 1.2).animate(repeat: true, reverse: true),
        ],
      ),
    );
  }
}
