import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

void main() {
  testWidgets('AnimatedButton scales on tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedButton(onPressed: () {}, child: const Text('Button')),
      ),
    );
    expect(find.byType(GestureDetector), findsWidgets);
  });

  testWidgets('AnimatedCard renders effects', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: AnimatedCard(child: Text('Card'))),
    );
    expect(find.byType(ParallelBuilder), findsOneWidget);
  });

  testWidgets('AnimatedFAB renders effects', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedFAB(onPressed: () {}, child: const Icon(Icons.add)),
      ),
    );
    expect(find.byType(AnimatedButton), findsOneWidget);
    expect(find.byType(EffectBuilder), findsOneWidget);
  });

  testWidgets('CustomAnimatedContainer applies effects', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomAnimatedContainer(
          effects: [FadeEffect()],
          child: Text('Container'),
        ),
      ),
    );
    expect(find.byType(ParallelBuilder), findsOneWidget);
  });

  testWidgets('CustomAnimatedList renders children in stagger', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomAnimatedList(
          itemCount: 3,
          itemBuilder: (context, index) => Text('Item $index'),
        ),
      ),
    );
    expect(find.text('Item 0'), findsOneWidget);
    expect(find.text('Item 1'), findsOneWidget);
  });

  testWidgets('AnimatedTextField renders TextField', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AnimatedTextField(hintText: 'Search...')),
      ),
    );
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Search...'), findsOneWidget);
  });

  testWidgets('AnimatedText renders Text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AnimatedText('Animated Hello'))),
    );
    expect(find.text('Animated Hello'), findsOneWidget);
  });

  testWidgets('AnimatedImage renders Image', (tester) async {
    // Use a transparent memory image for testing
    final imageProvider = MemoryImage(
      Uint8List.fromList([
        137,
        80,
        78,
        71,
        13,
        10,
        26,
        10,
        0,
        0,
        0,
        13,
        73,
        72,
        68,
        82,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        1,
        8,
        6,
        0,
        0,
        0,
        31,
        21,
        196,
        137,
        0,
        0,
        0,
        10,
        73,
        68,
        65,
        84,
        120,
        156,
        99,
        0,
        1,
        0,
        0,
        5,
        0,
        1,
        13,
        10,
        45,
        180,
        0,
        0,
        0,
        0,
        73,
        69,
        78,
        68,
        174,
        66,
        96,
        130,
      ]),
    );
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: AnimatedImage(image: imageProvider))),
    );
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('CustomAnimatedGrid renders children in stagger', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomAnimatedGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 3,
          itemBuilder: (context, index) => Text('Item $index'),
        ),
      ),
    );
    expect(find.text('Item 0'), findsOneWidget);
  });

  testWidgets('AnimatedSearchBar toggles width', (WidgetTester tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: AnimatedSearchBar(controller: controller)),
      ),
    );
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('AnimatedBottomNavigationBar renders items', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: AnimatedBottomNavigationBar(
            items: const [
              AnimatedBottomNavItem(icon: Icons.home, label: 'Home'),
              AnimatedBottomNavItem(icon: Icons.person, label: 'Profile'),
            ],
            currentIndex: 0,
            onTap: (i) {},
          ),
        ),
      ),
    );
    expect(find.text('Home'), findsOneWidget);
    expect(find.byType(EffectBuilder), findsWidgets);
  });

  testWidgets('AnimatedDrawer renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: AnimatedDrawer(child: Text('Drawer'))),
    );
    expect(find.byType(EffectBuilder), findsOneWidget);
  });
}
