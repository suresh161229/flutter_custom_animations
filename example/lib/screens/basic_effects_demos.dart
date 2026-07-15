import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import 'category_screen.dart';
import 'demo_screen.dart';

class BasicEffectsDemos {
  static final List<DemoItem> demos = [
    DemoItem(
      title: 'Fade Animation',
      subtitle: 'Opacity transitions',
      builder:
          (c) => const DemoScreen(
            title: 'Fade',
            description:
                'Smoothly changes the opacity of a widget from a begin value to an end value.',
            codeSnippet: '''
Text('Fading Text')
  .fade(begin: 0.0, end: 1.0)
  .animate(duration: Duration(seconds: 1));
''',
            demoWidget: _FadeDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Slide Animation',
      subtitle: 'Directional movement',
      builder:
          (c) => const DemoScreen(
            title: 'Slide',
            description:
                'Moves a widget by a fractional offset relative to its own size.',
            codeSnippet: '''
Text('Sliding Text')
  .slide(begin: Offset(0, 1), end: Offset.zero)
  .animate();
''',
            demoWidget: _SlideDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Scale Animation',
      subtitle: 'Size transformations',
      builder:
          (c) => const DemoScreen(
            title: 'Scale',
            description: 'Scales a widget up or down from a center point.',
            codeSnippet: '''
Text('Scaling Text')
  .scale(begin: 0.5, end: 1.5)
  .animate();
''',
            demoWidget: _ScaleDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Rotation Animation',
      subtitle: '2D & 3D spinning',
      builder:
          (c) => const DemoScreen(
            title: 'Rotation',
            description: 'Rotates a widget around an axis.',
            codeSnippet: '''
Text('Rotating Text')
  .rotate(begin: 0.0, end: 2.0)
  .animate();
''',
            demoWidget: _RotationDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Blur Animation',
      subtitle: 'Gaussian blur transitions',
      builder:
          (c) => const DemoScreen(
            title: 'Blur',
            description:
                'Applies an animated gaussian blur filter to the child widget.',
            codeSnippet: '''
Text('Blurry Text')
  .blur(begin: 10.0, end: 0.0)
  .animate();
''',
            demoWidget: _BlurDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Zoom Animation',
      subtitle: 'Scale and fade combined',
      builder:
          (c) => const DemoScreen(
            title: 'Zoom',
            description:
                'A composite effect that combines scaling and fading to create a zoom-in/out appearance.',
            codeSnippet: '''
Text('Zooming Text')
  .zoom(begin: 0.0, end: 1.0)
  .animate();
''',
            demoWidget: _ZoomDemoWidget(),
          ),
    ),
  ];
}

class _FadeDemoWidget extends StatelessWidget {
  const _FadeDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('Fade Me', style: TextStyle(color: Colors.white)),
          ),
        )
        .fade(begin: 0.2, end: 1.0)
        .animate(
          repeat: true,
          reverse: true,
          duration: const Duration(seconds: 1),
        );
  }
}

class _SlideDemoWidget extends StatelessWidget {
  const _SlideDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('Slide Me', style: TextStyle(color: Colors.white)),
          ),
        )
        .slide(begin: const Offset(0, 0.5), end: const Offset(0, -0.5))
        .animate(
          repeat: true,
          reverse: true,
          duration: const Duration(seconds: 1),
        );
  }
}

class _ScaleDemoWidget extends StatelessWidget {
  const _ScaleDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('Scale Me', style: TextStyle(color: Colors.white)),
          ),
        )
        .scale(begin: 0.5, end: 1.5)
        .animate(
          repeat: true,
          reverse: true,
          duration: const Duration(seconds: 1),
        );
  }
}

class _RotationDemoWidget extends StatelessWidget {
  const _RotationDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('Rotate Me', style: TextStyle(color: Colors.black)),
          ),
        )
        .rotate(begin: 0, end: 1)
        .animate(
          repeat: true,
          reverse: false,
          duration: const Duration(seconds: 2),
        );
  }
}

class _BlurDemoWidget extends StatelessWidget {
  const _BlurDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('Blur Me', style: TextStyle(color: Colors.black)),
          ),
        )
        .blur(begin: 10, end: 0)
        .animate(
          repeat: true,
          reverse: true,
          duration: const Duration(seconds: 1),
        );
  }
}

class _ZoomDemoWidget extends StatelessWidget {
  const _ZoomDemoWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text('Zoom Me', style: TextStyle(color: Colors.white)),
          ),
        )
        .zoom(begin: 0, end: 1)
        .animate(
          repeat: true,
          reverse: true,
          duration: const Duration(seconds: 1),
        );
  }
}
