import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

void main() {
  testWidgets('ScaleAnimation.scaleUp starts at 0.0 and ends at 1.0', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ScaleAnimation.scaleUp(
            duration: Duration(milliseconds: 100),
            child: Text('Scale Up'),
          ),
        ),
      ),
    );

    final scaleFinder = find.descendant(
      of: find.byType(ScaleAnimation),
      matching: find.byType(ScaleTransition),
    );
    expect(scaleFinder, findsOneWidget);

    ScaleTransition scaleTransition = tester.widget(scaleFinder);
    expect(scaleTransition.scale.value, equals(0.0));

    await tester.pumpAndSettle();

    scaleTransition = tester.widget(scaleFinder);
    expect(scaleTransition.scale.value, equals(1.0));
  });

  testWidgets('ScaleAnimation triggers callbacks', (WidgetTester tester) async {
    bool started = false;
    bool completed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScaleAnimation.scaleUp(
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
