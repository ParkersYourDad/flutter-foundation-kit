import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation_ui/foundation_ui.dart';

void main() {
  testWidgets('renders content with the active semantic surface color', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: FoundationTheme.light(),
        home: const Scaffold(
          body: FoundationSurface(
            child: Text('Reusable content'),
          ),
        ),
      ),
    );

    expect(find.text('Reusable content'), findsOneWidget);

    final surface = tester.widget<DecoratedBox>(
      find.descendant(
        of: find.byType(FoundationSurface),
        matching: find.byType(DecoratedBox),
      ),
    );
    final decoration = surface.decoration as BoxDecoration;
    expect(decoration.color, FoundationColors.light.surface);
  });
}
