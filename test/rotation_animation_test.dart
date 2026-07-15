import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  testWidgets('RotationAnimation.clockwise starts at 0.0 and ends at 1.0', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RotationAnimation.clockwise(
            duration: Duration(milliseconds: 100),
            child: Text('Rotate'),
          ),
        ),
      ),
    );

    final rotationFinder = find.descendant(
      of: find.byType(RotationAnimation),
      matching: find.byType(RotationTransition),
    );
    expect(rotationFinder, findsOneWidget);

    RotationTransition rotationTransition = tester.widget(rotationFinder);
    expect(rotationTransition.turns.value, equals(0.0));

    await tester.pumpAndSettle();

    rotationTransition = tester.widget(rotationFinder);
    expect(rotationTransition.turns.value, equals(1.0));
  });

  testWidgets('RotationAnimation triggers callbacks', (WidgetTester tester) async {
    bool started = false;
    bool completed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RotationAnimation.clockwise(
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
