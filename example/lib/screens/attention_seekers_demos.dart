import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
import 'category_screen.dart';
import 'demo_screen.dart';

class AttentionSeekersDemos {
  static final List<DemoItem> demos = [
    DemoItem(
      title: 'Bounce Animation',
      subtitle: 'Spring physics',
      builder:
          (c) => const DemoScreen(
            title: 'Bounce',
            description:
                'Bounces the widget vertically like a ball using spring physics approximations.',
            codeSnippet: '''
Text('Bouncing Text')
  .bounce()
  .animate();
''',
            demoWidget: _BounceDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Pulse Animation',
      subtitle: 'Heartbeat scaling',
      builder:
          (c) => const DemoScreen(
            title: 'Pulse',
            description:
                'Scales the widget up and down rapidly to attract attention.',
            codeSnippet: '''
Text('Pulsing Text')
  .pulse()
  .animate();
''',
            demoWidget: _PulseDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Shake Animation',
      subtitle: 'Horizontal shaking',
      builder:
          (c) => const DemoScreen(
            title: 'Shake',
            description:
                'Shakes the widget horizontally, typically used to indicate an error or invalid input.',
            codeSnippet: '''
Text('Shaking Text')
  .shake()
  .animate();
''',
            demoWidget: _ShakeDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Flip Animation',
      subtitle: 'Card flipping effects',
      builder:
          (c) => const DemoScreen(
            title: 'Flip',
            description:
                'Applies a 3D rotation flip on the Y axis, simulating a card flipping over.',
            codeSnippet: '''
Text('Flipping Text')
  .flip()
  .animate();
''',
            demoWidget: _FlipDemoWidget(),
          ),
    ),
  ];
}

class _BounceDemoWidget extends StatelessWidget {
  const _BounceDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          'Bounce',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ).bounce().animate(
      repeat: true,
      duration: const Duration(milliseconds: 1500),
    );
  }
}

class _PulseDemoWidget extends StatelessWidget {
  const _PulseDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(Icons.favorite, color: Colors.white, size: 48),
      ),
    ).pulse().animate(
      repeat: true,
      duration: const Duration(milliseconds: 800),
    );
  }
}

class _ShakeDemoWidget extends StatelessWidget {
  const _ShakeDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Error! Shake me.',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ).shake().animate(
      repeat: true,
      duration: const Duration(milliseconds: 1000),
    );
  }
}

class _FlipDemoWidget extends StatelessWidget {
  const _FlipDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          'Flip Card',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ).flip().animate(
      repeat: true,
      reverse: true,
      duration: const Duration(seconds: 1),
    );
  }
}
