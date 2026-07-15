import 'package:flutter/material.dart';
import 'package:custom_animation/custom_animation.dart';
import '../utils/demo_scaffold.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Hero Animation',
      child: Center(
        child: AnimatedButton(
          onPressed: () {
            Navigator.push(context, HeroRoute(page: const _HeroDetailsPage()));
          },
          effect: const ScaleEffect(begin: 1.0, end: 0.9),
          child: const Hero(
            tag: 'hero-box',
            child: DemoBox(label: 'Tap Me!'),
          ),
        ),
      ),
    );
  }
}

class _HeroDetailsPage extends StatelessWidget {
  const _HeroDetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Details')),
      backgroundColor: Colors.transparent, // Required for HeroRoute translucent barrier
      body: Center(
        child: Hero(
          tag: 'hero-box',
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(40),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Expanded!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
