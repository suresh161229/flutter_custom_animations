import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_animation/custom_animation.dart';

void main() {
  Widget buildApp(Route<dynamic> route) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () => Navigator.push(context, route),
          child: const Text('Push'),
        );
      }),
    );
  }

  testWidgets('FadeRoute pushes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(buildApp(FadeRoute(page: const Text('Faded Page'))));
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();
    expect(find.text('Faded Page'), findsOneWidget);
  });

  testWidgets('SlideRoute pushes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(buildApp(SlideRoute(page: const Text('Slide Page'))));
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();
    expect(find.text('Slide Page'), findsOneWidget);
  });

  testWidgets('ScaleRoute pushes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(buildApp(ScaleRoute(page: const Text('Scale Page'))));
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();
    expect(find.text('Scale Page'), findsOneWidget);
  });

  testWidgets('ZoomRoute pushes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(buildApp(ZoomRoute(page: const Text('Zoom Page'))));
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();
    expect(find.text('Zoom Page'), findsOneWidget);
  });

  testWidgets('SharedAxisRoute pushes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(buildApp(SharedAxisRoute(page: const Text('SharedAxis Page'), type: SharedAxis.y)));
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();
    expect(find.text('SharedAxis Page'), findsOneWidget);
  });

  testWidgets('MaterialMotionRoute pushes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(buildApp(MaterialMotionRoute(page: const Text('Motion Page'))));
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();
    expect(find.text('Motion Page'), findsOneWidget);
  });

  testWidgets('HeroRoute pushes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(buildApp(HeroRoute(page: const Text('Hero Page'))));
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();
    expect(find.text('Hero Page'), findsOneWidget);
  });

  // Navigator 2.0 Page Tests
  test('FadePage creates FadeRoute', () {
    const page = FadePage<dynamic>(child: Text('Test'));
    expect(page.createRoute(TestContext()), isA<FadeRoute<dynamic>>());
  });

  test('SlidePage creates SlideRoute', () {
    const page = SlidePage<dynamic>(child: Text('Test'));
    expect(page.createRoute(TestContext()), isA<SlideRoute<dynamic>>());
  });
  
  test('ScalePage creates ScaleRoute', () {
    const page = ScalePage<dynamic>(child: Text('Test'));
    expect(page.createRoute(TestContext()), isA<ScaleRoute<dynamic>>());
  });
  
  test('ZoomPage creates ZoomRoute', () {
    const page = ZoomPage<dynamic>(child: Text('Test'));
    expect(page.createRoute(TestContext()), isA<ZoomRoute<dynamic>>());
  });
  
  test('SharedAxisPage creates SharedAxisRoute', () {
    const page = SharedAxisPage<dynamic>(child: Text('Test'), type: SharedAxis.x);
    expect(page.createRoute(TestContext()), isA<SharedAxisRoute<dynamic>>());
  });
  
  test('MaterialMotionPage creates MaterialMotionRoute', () {
    const page = MaterialMotionPage<dynamic>(child: Text('Test'));
    expect(page.createRoute(TestContext()), isA<MaterialMotionRoute<dynamic>>());
  });
  
  test('CupertinoPage creates CupertinoRoute', () {
    const page = CupertinoPage<dynamic>(child: Text('Test'));
    expect(page.createRoute(TestContext()), isA<CupertinoRoute<dynamic>>());
  });
  
  test('HeroPage creates HeroRoute', () {
    const page = HeroPage<dynamic>(child: Text('Test'));
    expect(page.createRoute(TestContext()), isA<HeroRoute<dynamic>>());
  });
}

class TestContext extends BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
