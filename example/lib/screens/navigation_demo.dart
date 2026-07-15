import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/demo_scaffold.dart';

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Page Transitions',
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: [
          _buildNavBtn(context, 'FadeRoute', FadeRoute(page: const _DummyPage('Fade'))),
          _buildNavBtn(context, 'SlideRoute', SlideRoute(page: const _DummyPage('Slide'))),
          _buildNavBtn(context, 'ScaleRoute', ScaleRoute(page: const _DummyPage('Scale'))),
          _buildNavBtn(context, 'ZoomRoute', ZoomRoute(page: const _DummyPage('Zoom'))),
          _buildNavBtn(context, 'SharedAxis X', SharedAxisRoute(page: const _DummyPage('Shared X'), type: SharedAxis.x)),
          _buildNavBtn(context, 'MaterialMotion', MaterialMotionRoute(page: const _DummyPage('Material'))),
          _buildNavBtn(context, 'Cupertino', CupertinoRoute(page: const _DummyPage('Cupertino'))),
        ],
      ).stagger(staggerRatio: 0.1),
    );
  }

  Widget _buildNavBtn(BuildContext context, String label, Route route) {
    return AnimatedButton(
      onPressed: () => Navigator.push(context, route),
      effect: const ScaleEffect(begin: 1.0, end: 0.9),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.indigo.withValues(alpha: 0.2),
      ),
    );
  }
}

class _DummyPage extends StatelessWidget {
  final String title;
  const _DummyPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: const DemoBox(label: 'Arrived!').bounce(),
      ),
    );
  }
}
