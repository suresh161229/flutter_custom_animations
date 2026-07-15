import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  testWidgets('Widget extensions avoid nesting and return CustomAnimatedWidgetChain', (WidgetTester tester) async {
    final widget = const Text('Test').fade().slide().scale();
    
    expect(widget, isA<CustomAnimatedWidgetChain>());
    
    expect(widget.effects.length, 3);
    
    await tester.pumpWidget(MaterialApp(home: widget));
    expect(find.byType(ParallelBuilder), findsOneWidget);
  });

  testWidgets('Widget extensions apply sequence builder', (WidgetTester tester) async {
    final widget = const Text('Test').fade().slide().sequence();
    
    await tester.pumpWidget(MaterialApp(home: widget));
    expect(find.byType(SequenceBuilder), findsOneWidget);
  });

  testWidgets('Widget extensions apply stagger builder', (WidgetTester tester) async {
    final widget = const Text('Test').fade().slide().stagger();
    
    await tester.pumpWidget(MaterialApp(home: widget));
    expect(find.byType(StaggerBuilder), findsOneWidget);
  });

  testWidgets('Widget extensions apply chain builder alias', (WidgetTester tester) async {
    final widget = const Text('Test').fade().slide().chain();
    
    await tester.pumpWidget(MaterialApp(home: widget));
    expect(find.byType(SequenceBuilder), findsOneWidget);
  });
}
