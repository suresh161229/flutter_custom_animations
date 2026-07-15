import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/demo_scaffold.dart';

class MicroInteractionsDemo extends StatelessWidget {
  const MicroInteractionsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Micro Interactions',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedButton(
            onPressed: () {},
            effect: const ScaleEffect(begin: 1.0, end: 0.9),
            child: const DemoBox(label: 'Press Me', color: Colors.purple),
          ),
          
          const SizedBox(height: 40),
          
          AnimatedButton(
            onPressed: () {},
            effect: const RotationEffect(begin: 0.0, end: 0.05), // Wiggle
            child: const DemoBox(label: 'Wiggle', color: Colors.orange),
          ),
          
          const SizedBox(height: 40),
          
          const Text('Fluent API Chaining:', style: TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 20),
          
          const Icon(Icons.favorite, color: Colors.pink, size: 80)
            .bounce()
            .jelly()
            .animate(repeat: true, reverse: true),
        ],
      ),
    );
  }
}
