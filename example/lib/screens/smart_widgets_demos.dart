import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
import 'category_screen.dart';
import 'demo_screen.dart';

class SmartWidgetsDemos {
  static final List<DemoItem> demos = [
    DemoItem(
      title: 'Animated Button',
      subtitle: 'Interactive buttons',
      builder:
          (c) => const DemoScreen(
            title: 'AnimatedButton',
            description:
                'A button that inherently animates when pressed, providing instant tactile feedback.',
            codeSnippet: '''
AnimatedButton(
  onPressed: () => print('Tapped!'),
  child: Text('Tap Me'),
)
''',
            demoWidget: _AnimatedButtonDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Animated Card',
      subtitle: 'Hover and tap effects',
      builder:
          (c) => const DemoScreen(
            title: 'AnimatedCard',
            description: 'A card widget that elegantly enters the screen.',
            codeSnippet: '''
AnimatedCard(
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Text('Interactive Card'),
  ),
)
''',
            demoWidget: _AnimatedCardDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Animated Dialog',
      subtitle: 'Pop-up transitions',
      builder:
          (c) => const DemoScreen(
            title: 'AnimatedDialog',
            description: 'A dialog overlay that animates into view elegantly.',
            codeSnippet: '''
showAnimatedDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('Hello'),
  ),
  effects: const [ZoomEffect()],
)
''',
            demoWidget: _AnimatedDialogDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Animated Container',
      subtitle: 'Custom property animations',
      builder:
          (c) => const DemoScreen(
            title: 'CustomAnimatedContainer',
            description:
                'Integrates seamlessly with the custom animation effect pipeline.',
            codeSnippet: '''
CustomAnimatedContainer(
  effects: [FadeEffect(), ScaleEffect()],
  child: FlutterLogo(),
)
''',
            demoWidget: _AnimatedContainerDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Animated List',
      subtitle: 'Staggered lists',
      builder:
          (c) => const DemoScreen(
            title: 'CustomAnimatedList',
            description:
                'Automatically staggers the entrance animation of its children for a polished list appearance.',
            codeSnippet: '''
CustomAnimatedList(
  effects: [SlideEffect(), FadeEffect()],
  itemCount: 10,
  itemBuilder: (context, index) => ListTile(title: Text('Item \$index')),
)
''',
            demoWidget: _AnimatedListDemoWidget(),
          ),
    ),
    DemoItem(
      title: 'Animated Grid',
      subtitle: 'Staggered grids',
      builder:
          (c) => const DemoScreen(
            title: 'CustomAnimatedGrid',
            description:
                'A grid version of CustomAnimatedList, cascading animations across rows and columns.',
            codeSnippet: '''
CustomAnimatedGrid(
  effects: [ScaleEffect(), FadeEffect()],
  itemCount: 12,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  itemBuilder: (context, index) => Card(),
)
''',
            demoWidget: _AnimatedGridDemoWidget(),
          ),
    ),
  ];
}

class _AnimatedButtonDemoWidget extends StatelessWidget {
  const _AnimatedButtonDemoWidget();
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Button Pressed!')));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Text(
          'Tap Me',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _AnimatedCardDemoWidget extends StatelessWidget {
  const _AnimatedCardDemoWidget();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Card Tapped!')));
      },
      child: AnimatedCard(
        child: Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Interactive Card',
              style: TextStyle(color: Colors.black87, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedDialogDemoWidget extends StatelessWidget {
  const _AnimatedDialogDemoWidget();
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {
        showAnimatedDialog(
          context: context,
          builder:
              (ctx) => AlertDialog(
                title: const Text('Hello!'),
                content: const Text('This dialog animated smoothly into view.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Close'),
                  ),
                ],
              ),
          effects: const [ZoomEffect()],
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('Show Dialog', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _AnimatedContainerDemoWidget extends StatelessWidget {
  const _AnimatedContainerDemoWidget();
  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 0.5))],
      duration: const Duration(seconds: 1),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Center(
          child: Icon(Icons.star, color: Colors.white, size: 64),
        ),
      ),
    );
  }
}

class _AnimatedListDemoWidget extends StatelessWidget {
  const _AnimatedListDemoWidget();
  @override
  Widget build(BuildContext context) {
    return CustomAnimatedList(
      effects: const [FadeEffect(), SlideEffect(begin: Offset(-0.2, 0))],
      staggerDuration: const Duration(milliseconds: 100),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('List Item \$index'),
            subtitle: const Text('Staggered entrance'),
          ),
        );
      },
    );
  }
}

class _AnimatedGridDemoWidget extends StatelessWidget {
  const _AnimatedGridDemoWidget();
  @override
  Widget build(BuildContext context) {
    return CustomAnimatedGrid(
      effects: const [ScaleEffect(), FadeEffect()],
      staggerDuration: const Duration(milliseconds: 50),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              '\$index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
