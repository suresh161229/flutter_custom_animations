import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  testWidgets('BounceAnimation renders Transform', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: BounceAnimation(child: Text('Bounce'))),
    );
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('ShakeAnimation renders Transform', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: ShakeAnimation(child: Text('Shake'))),
    );
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('PulseAnimation renders Transform', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: PulseAnimation(child: Text('Pulse'))),
    );
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('FlipAnimation renders Transform', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: FlipAnimation(child: Text('Flip'))),
    );
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('BlurAnimation renders ImageFiltered', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: BlurAnimation(child: Text('Blur'))),
    );
    expect(find.byType(ImageFiltered), findsWidgets);
  });

  testWidgets('ZoomAnimation renders Transform and Opacity', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: ZoomAnimation(child: Text('Zoom'))),
    );
    expect(find.byType(Transform), findsWidgets);
    expect(find.byType(Opacity), findsWidgets);
  });

  testWidgets('ElasticAnimation renders Transform', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: ElasticAnimation(child: Text('Elastic'))),
    );
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('SwingAnimation renders Transform', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SwingAnimation(child: Text('Swing'))),
    );
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('JellyAnimation renders Transform', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: JellyAnimation(child: Text('Jelly'))),
    );
    expect(find.byType(Transform), findsWidgets);
  });
}
