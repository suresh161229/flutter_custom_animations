import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
import 'category_screen.dart';
import 'demo_screen.dart';

class NavigationDemos {
  static final List<DemoItem> demos = [
    DemoItem(
      title: 'Fade Route',
      subtitle: 'Opacity page transitions',
      builder:
          (c) => const DemoScreen(
            title: 'FadeRoute',
            description: 'Navigates to a new route with a smooth fade in.',
            codeSnippet: '''
Navigator.push(
  context,
  FadeRoute(page: NextScreen()),
);
''',
            demoWidget: _FadeRouteDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Slide Route',
      subtitle: 'Directional page transitions',
      builder:
          (c) => const DemoScreen(
            title: 'SlideRoute',
            description:
                'Navigates to a new route by sliding it in from a specific edge.',
            codeSnippet: '''
Navigator.push(
  context,
  SlideRoute(
    page: NextScreen(),
    direction: AxisDirection.left,
  ),
);
''',
            demoWidget: _SlideRouteDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Scale Route',
      subtitle: 'Size page transitions',
      builder:
          (c) => const DemoScreen(
            title: 'ScaleRoute',
            description:
                'Navigates to a new route by scaling it up from the center.',
            codeSnippet: '''
Navigator.push(
  context,
  ScaleRoute(page: NextScreen()),
);
''',
            demoWidget: _ScaleRouteDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Shared Axis Route',
      subtitle: 'Material shared axis',
      builder:
          (c) => const DemoScreen(
            title: 'SharedAxisRoute',
            description:
                'Navigates using Material Design shared axis transition patterns.',
            codeSnippet: '''
Navigator.push(
  context,
  SharedAxisRoute(
    page: NextScreen(),
    type: SharedAxisTransitionType.horizontal,
  ),
);
''',
            demoWidget: _SharedAxisRouteDemoWidget(),
          ),
    ),
  ];
}

class _DummyScreen extends StatelessWidget {
  final String title;
  const _DummyScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: AnimatedButton(
          onPressed: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Go Back', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class _FadeRouteDemoWidget extends StatelessWidget {
  const _FadeRouteDemoWidget();
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {
        Navigator.push(
          context,
          FadeRoute(page: const _DummyScreen('Fade Route')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Navigate (Fade)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _SlideRouteDemoWidget extends StatelessWidget {
  const _SlideRouteDemoWidget();
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {
        Navigator.push(
          context,
          SlideRoute(page: const _DummyScreen('Slide Route')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Navigate (Slide)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _ScaleRouteDemoWidget extends StatelessWidget {
  const _ScaleRouteDemoWidget();
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {
        Navigator.push(
          context,
          ScaleRoute(page: const _DummyScreen('Scale Route')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Navigate (Scale)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _SharedAxisRouteDemoWidget extends StatelessWidget {
  const _SharedAxisRouteDemoWidget();
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {
        Navigator.push(
          context,
          SharedAxisRoute(
            page: const _DummyScreen('Shared Axis Route'),
            type: SharedAxis.x,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Navigate (Shared Axis)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
