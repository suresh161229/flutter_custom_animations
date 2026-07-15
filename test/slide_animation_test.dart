import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  testWidgets('SlideAnimation.left starts at (-1.0, 0.0) and ends at (0.0, 0.0)', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SlideAnimation.left(
            duration: Duration(milliseconds: 100),
            child: Text('Slide Left'),
          ),
        ),
      ),
    );

    final slideFinder = find.byType(SlideTransition);
    expect(slideFinder, findsOneWidget);

    SlideTransition slideTransition = tester.widget(slideFinder);
    expect(slideTransition.position.value, equals(const Offset(-1.0, 0.0)));

    await tester.pumpAndSettle();

    slideTransition = tester.widget(slideFinder);
    expect(slideTransition.position.value, equals(Offset.zero));
  });

  testWidgets('SlideAnimation triggers callbacks', (WidgetTester tester) async {
    bool started = false;
    bool completed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SlideAnimation.bottom(
            duration: const Duration(milliseconds: 100),
            onStart: () => started = true,
            onComplete: () => completed = true,
            child: const Text('Callbacks'),
          ),
        ),
      ),
    );

    expect(started, isTrue);
    expect(completed, isFalse);

    await tester.pumpAndSettle();

    expect(completed, isTrue);
  });
}
