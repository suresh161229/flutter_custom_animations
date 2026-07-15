import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  testWidgets('EffectBuilder applies single effect', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: EffectBuilder(effect: FadeEffect(), child: Text('Effect')),
      ),
    );
    expect(find.byType(Opacity), findsWidgets);
  });

  testWidgets('ParallelBuilder applies multiple effects simultaneously', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ParallelBuilder(
          effects: [FadeEffect(), ScaleEffect()],
          child: Text('Parallel'),
        ),
      ),
    );
    expect(find.byType(Opacity), findsWidgets);
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('SequenceBuilder applies effects', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SequenceBuilder(
          effects: [FadeEffect(), ScaleEffect()],
          child: Text('Sequence'),
        ),
      ),
    );
    expect(find.byType(Opacity), findsWidgets);
    expect(find.byType(Transform), findsWidgets);
  });

  testWidgets('StaggerBuilder applies effects', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: StaggerBuilder(
          effects: [FadeEffect(), ScaleEffect(), SlideEffect()],
          staggerRatio: 0.2,
          child: Text('Stagger'),
        ),
      ),
    );
    expect(find.byType(Opacity), findsWidgets);
    expect(find.byType(Transform), findsWidgets);
    expect(find.byType(FractionalTranslation), findsWidgets);
  });

  testWidgets('ChainBuilder applies chained effects', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ChainBuilder(
          chainedEffects: [
            ChainedEffect(FadeEffect(), Duration(milliseconds: 500)),
            ChainedEffect(ScaleEffect(), Duration(milliseconds: 200)),
          ],
          child: Text('Chain'),
        ),
      ),
    );
    expect(find.byType(Opacity), findsWidgets);
    expect(find.byType(Transform), findsWidgets);
  });
}
