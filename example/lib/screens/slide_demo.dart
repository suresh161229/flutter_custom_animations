import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/demo_scaffold.dart';

class SlideDemo extends StatelessWidget {
  const SlideDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Slide Animation',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DemoBox(label: 'From Left')
              .slide(begin: const Offset(-2.0, 0.0)),
              
          const SizedBox(height: 20),
          
          const DemoBox(label: 'From Right', color: Colors.orange)
              .slide(begin: const Offset(2.0, 0.0)),
              
          const SizedBox(height: 20),
          
          const DemoBox(label: 'From Bottom', color: Colors.green)
              .slide(begin: const Offset(0.0, 2.0)),
        ],
      ).stagger(staggerRatio: 0.3, duration: const Duration(milliseconds: 600)),
    );
  }
}
