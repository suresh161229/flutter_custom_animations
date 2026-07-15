import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import 'category_screen.dart';
import 'demo_screen.dart';

class CompositionDemos {
  static final List<DemoItem> demos = [
    DemoItem(
      title: 'Widget Extensions',
      subtitle: 'Fluent API chaining',
      builder:
          (c) => const DemoScreen(
            title: 'Widget Extensions',
            description:
                'Chain animations directly on widgets without deeply nesting builders.',
            codeSnippet: '''
Text('Fluent UI')
  .slide()
  .fade()
  .scale()
  .animate();
''',
            demoWidget: _ExtensionsDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Sequence Builder',
      subtitle: 'Chained effects',
      builder:
          (c) => const DemoScreen(
            title: 'SequenceBuilder',
            description: 'Runs a series of effects one after another in order.',
            codeSnippet: '''
Text('Sequential')
  .slide(begin: Offset(0, -1), end: Offset.zero)
  .bounce()
  .fade()
  .sequence(duration: Duration(seconds: 3));
''',
            demoWidget: _SequenceDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Stagger Builder',
      subtitle: 'Overlapping effects',
      builder:
          (c) => const DemoScreen(
            title: 'StaggerBuilder',
            description:
                'Runs multiple effects overlapping slightly based on a staggerRatio.',
            codeSnippet: '''
Text('Staggered')
  .slide()
  .fade()
  .scale()
  .stagger(staggerRatio: 0.2);
''',
            demoWidget: _StaggerDemoWidget(),
          ),
    ),
  ];
}

class _ExtensionsDemoWidget extends StatelessWidget {
  const _ExtensionsDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Fluent',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        )
        .slide(begin: const Offset(-0.5, 0))
        .scale(begin: 0.5)
        .fade(begin: 0)
        .animate(duration: const Duration(seconds: 2));
  }
}

class _SequenceDemoWidget extends StatelessWidget {
  const _SequenceDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Sequence',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        )
        .slide(begin: const Offset(0, -1))
        .scale(begin: 0.5)
        .bounce()
        .fade()
        .sequence(duration: const Duration(seconds: 3), repeat: true);
  }
}

class _StaggerDemoWidget extends StatelessWidget {
  const _StaggerDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.lime,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Stagger',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        )
        .scale(begin: 0.0, end: 1.0)
        .rotate(begin: 0.0, end: 1.0)
        .fade(begin: 0.0, end: 1.0)
        .stagger(
          staggerRatio: 0.3,
          duration: const Duration(seconds: 2),
          repeat: true,
        );
  }
}
