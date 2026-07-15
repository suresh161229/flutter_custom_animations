import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  testWidgets('FadeEffect correctly interpolates values mid-animation', (
    WidgetTester tester,
  ) async {
    const fadeEffect = FadeEffect(begin: 0.0, end: 1.0);
    final controller = AnimationController(
      vsync: const TestVSync(),
      duration: const Duration(seconds: 1),
    );

    final childKey = GlobalKey();
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return fadeEffect.build(
              context,
              SizedBox(key: childKey),
              controller,
            );
          },
        ),
      ),
    );

    // Initial state
    Opacity fade = tester.widget(
      find
          .ancestor(of: find.byKey(childKey), matching: find.byType(Opacity))
          .first,
    );
    expect(fade.opacity, 0.0);

    // Halfway state
    controller.value = 0.5;
    await tester.pump();
    fade = tester.widget(
      find
          .ancestor(of: find.byKey(childKey), matching: find.byType(Opacity))
          .first,
    );
    expect(fade.opacity, 0.5);

    // End state
    controller.value = 1.0;
    await tester.pump();
    fade = tester.widget(
      find
          .ancestor(of: find.byKey(childKey), matching: find.byType(Opacity))
          .first,
    );
    expect(fade.opacity, 1.0);
  });

  testWidgets('ScaleEffect correctly interpolates values mid-animation', (
    WidgetTester tester,
  ) async {
    const scaleEffect = ScaleEffect(begin: 0.0, end: 1.0);
    final controller = AnimationController(
      vsync: const TestVSync(),
      duration: const Duration(seconds: 1),
    );

    final childKey = GlobalKey();
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return scaleEffect.build(
              context,
              SizedBox(key: childKey),
              controller,
            );
          },
        ),
      ),
    );

    Transform transformWidget = tester.widget(
      find
          .ancestor(of: find.byKey(childKey), matching: find.byType(Transform))
          .first,
    );
    expect(transformWidget.transform.storage[0], 0.0);

    controller.value = 0.5;
    await tester.pump();
    transformWidget = tester.widget(
      find
          .ancestor(of: find.byKey(childKey), matching: find.byType(Transform))
          .first,
    );
    expect(transformWidget.transform.storage[0], 0.5);
  });
}
