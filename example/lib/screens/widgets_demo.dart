import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/demo_scaffold.dart';

class WidgetsDemo extends StatefulWidget {
  const WidgetsDemo({super.key});

  @override
  State<WidgetsDemo> createState() => _WidgetsDemoState();
}

class _WidgetsDemoState extends State<WidgetsDemo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Animated Widgets',
      child: ListView(
        shrinkWrap: true,
        children: [
          AnimatedButton(
            onPressed: () {},
            effect: const ScaleEffect(begin: 1.0, end: 0.9),
            child: const DemoBox(label: 'Button', color: Colors.red),
          ),
          const SizedBox(height: 20),
          const AnimatedCard(
            child: DemoBox(label: 'Card', color: Colors.blue),
          ),
          const SizedBox(height: 20),
          AnimatedSearchBar(controller: _controller),
        ],
      ),
    );
  }
}
