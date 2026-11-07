import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation_ui/foundation_ui.dart';

void main() {
  Widget buildSubject({
    VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return MaterialApp(
      theme: FoundationTheme.light(),
      home: Scaffold(
        body: Center(
          child: FoundationButton(
            label: 'Continue',
            onPressed: onPressed,
            isLoading: isLoading,
            loadingSemanticValue: 'Loading',
          ),
        ),
      ),
    );
  }

  Finder getButtonSemantics() {
    return find.byWidgetPredicate(
      (widget) =>
          widget is Semantics &&
          widget.properties.button == true &&
          widget.properties.label == 'Continue',
    );
  }

  testWidgets('invokes callback when enabled', (tester) async {
    var presses = 0;
    await tester.pumpWidget(buildSubject(onPressed: () => presses++));
    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(presses, 1);
  });

  testWidgets('does not invoke callback when disabled', (tester) async {
    final semantics = tester.ensureSemantics();
    addTearDown(semantics.dispose);

    var presses = 0;
    await tester.pumpWidget(buildSubject(onPressed: null));
    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(presses, 0);
    expect(
      tester.getSemantics(getButtonSemantics()),
      matchesSemantics(
        isButton: true,
        isEnabled: false,
        label: 'Continue',
      ),
    );
  });

  testWidgets('exposes localized loading state and progress indicator', (tester) async {
    final semantics = tester.ensureSemantics();
    addTearDown(semantics.dispose);

    await tester.pumpWidget(
      buildSubject(onPressed: () {}, isLoading: true),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(
      tester.getSemantics(getButtonSemantics()),
      matchesSemantics(
        isButton: true,
        isEnabled: false,
        label: 'Continue',
        value: 'Loading',
      ),
    );
  });
}
