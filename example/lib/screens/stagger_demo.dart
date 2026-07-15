import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
import '../utils/demo_scaffold.dart';

class StaggerDemo extends StatelessWidget {
  const StaggerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Staggered Lists',
      child: CustomAnimatedList(
        effects: const [FadeEffect(), SlideEffect(begin: Offset(1.0, 0.0))],
        staggerDuration: const Duration(milliseconds: 100),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blueGrey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Item $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
