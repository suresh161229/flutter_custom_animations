import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/styles.dart';
import 'fade_demo.dart';
import 'slide_demo.dart';
import 'scale_demo.dart';
import 'rotation_demo.dart';
import 'bounce_demo.dart';
import 'flip_demo.dart';
import 'widgets_demo.dart';
import 'navigation_demo.dart';
import 'stagger_demo.dart';
import 'hero_demo.dart';
import 'micro_interactions_demo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = [
      _DemoItem('Fade', 'Opacity transitions', (c) => const FadeDemo()),
      _DemoItem('Slide', 'Directional movement', (c) => const SlideDemo()),
      _DemoItem('Scale', 'Size transformations', (c) => const ScaleDemo()),
      _DemoItem('Rotation', '2D & 3D spinning', (c) => const RotationDemo()),
      _DemoItem('Bounce', 'Spring physics', (c) => const BounceDemo()),
      _DemoItem('Flip', 'Card flipping effects', (c) => const FlipDemo()),
      _DemoItem('Animated Widgets', 'Pre-built smart components', (c) => const WidgetsDemo()),
      _DemoItem('Navigation', 'Page transition routes', (c) => const NavigationDemo()),
      _DemoItem('Stagger', 'Delayed sequenced lists', (c) => const StaggerDemo()),
      _DemoItem('Hero', 'Cross-screen animations', (c) => const HeroDemo()),
      _DemoItem('Micro Interactions', 'Fluent API and gestures', (c) => const MicroInteractionsDemo()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animation'),
      ),
      body: CustomAnimatedList(
        effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 0.2))],
        staggerDuration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final item = demos[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _DemoCard(item: item),
          );
        },
      ),
    );
  }
}

class _DemoItem {
  final String title;
  final String subtitle;
  final WidgetBuilder builder;

  _DemoItem(this.title, this.subtitle, this.builder);
}

class _DemoCard extends StatelessWidget {
  final _DemoItem item;

  const _DemoCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {
        Navigator.push(context, FadeRoute(page: item.builder(context)));
      },
      effect: const ScaleEffect(begin: 1.0, end: 0.95),
      child: Container(
        decoration: AppStyles.glassCard,
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppStyles.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow_rounded, color: AppStyles.primary),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: AppStyles.heading2),
                  const SizedBox(height: 4),
                  Text(item.subtitle, style: AppStyles.body),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppStyles.textMuted),
          ],
        ),
      ),
    );
  }
}
