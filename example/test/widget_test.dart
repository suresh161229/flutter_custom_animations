import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Example app renders successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const ShowcaseApp());
    expect(find.text('Fade Animation'), findsOneWidget);
  });
}
