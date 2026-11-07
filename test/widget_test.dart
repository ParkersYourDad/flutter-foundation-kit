import 'package:flutter_test/flutter_test.dart';

import 'package:foundation_kit/main.dart';

void main() {
  testWidgets('shows the first-party design system showcase', (tester) async {
    await tester.pumpWidget(const FoundationKitApp());

    expect(find.text('First-party foundations'), findsOneWidget);
    expect(find.text('Primary'), findsOneWidget);
    expect(find.text('Surfaces'), findsOneWidget);
  });
}
