import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  Widget buildGolden(Widget child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: RepaintBoundary(child: child))),
    );
  }

  group('Golden Tests (Visual Regression)', () {
    testWidgets('AnimatedButton golden', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildGolden(
          AnimatedButton(
            onPressed: () {},
            child: Container(width: 100, height: 50, color: Colors.blue),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(RepaintBoundary).first,
        matchesGoldenFile('goldens/animated_button.png'),
      );
    });

    testWidgets('AnimatedCard golden', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildGolden(
          const AnimatedCard(
            child: SizedBox(
              width: 150,
              height: 100,
              child: ColoredBox(color: Colors.green),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(RepaintBoundary).first,
        matchesGoldenFile('goldens/animated_card.png'),
      );
    });

    testWidgets('CustomAnimatedContainer golden', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildGolden(
          const CustomAnimatedContainer(
            effects: [FadeEffect(), ScaleEffect()],
            child: SizedBox(
              width: 100,
              height: 100,
              child: ColoredBox(color: Colors.red),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(RepaintBoundary).first,
        matchesGoldenFile('goldens/custom_animated_container.png'),
      );
    });
  });
}
