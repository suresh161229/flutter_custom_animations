import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

void main() {
  testWidgets('FadeAnimation.fadeIn starts at 0.0 and ends at 1.0', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FadeAnimation.fadeIn(
            duration: Duration(milliseconds: 100),
            child: Text('Fade In'),
          ),
        ),
      ),
    );

    final fadeFinder = find.descendant(
      of: find.byType(FadeAnimation),
      matching: find.byType(FadeTransition),
    );
    expect(fadeFinder, findsOneWidget);

    FadeTransition fadeTransition = tester.widget(fadeFinder);
    expect(fadeTransition.opacity.value, equals(0.0));

    await tester.pumpAndSettle();

    fadeTransition = tester.widget(fadeFinder);
    expect(fadeTransition.opacity.value, equals(1.0));
  });

  testWidgets('FadeAnimation triggers callbacks', (WidgetTester tester) async {
    bool started = false;
    bool completed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FadeAnimation.fadeIn(
            duration: const Duration(milliseconds: 100),
            onStart: () => started = true,
            onComplete: () => completed = true,
            child: const Text('Callbacks'),
          ),
        ),
      ),
    );

    expect(started, isTrue); // Auto play starts it immediately
    expect(completed, isFalse);

    await tester.pumpAndSettle();

    expect(completed, isTrue);
  });
}
