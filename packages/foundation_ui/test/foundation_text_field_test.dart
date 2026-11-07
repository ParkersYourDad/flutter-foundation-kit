import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation_ui/foundation_ui.dart';

void main() {
  testWidgets('renders its configuration and reports input changes', (tester) async {
    String? changedValue;

    await tester.pumpWidget(
      MaterialApp(
        theme: FoundationTheme.light(),
        home: Scaffold(
          body: FoundationTextField(
            labelText: 'Email',
            hintText: 'name@example.com',
            onChanged: (value) => changedValue = value,
          ),
        ),
      ),
    );

    final field = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(field.decoration?.labelText, 'Email');
    expect(field.decoration?.hintText, 'name@example.com');

    await tester.enterText(find.byType(TextFormField), 'person@example.com');
    expect(changedValue, 'person@example.com');
  });

  testWidgets('displays validation errors from the enclosing form', (tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        theme: FoundationTheme.light(),
        home: Scaffold(
          body: Form(
            key: formKey,
            child: FoundationTextField(
              labelText: 'Email',
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );

    expect(formKey.currentState!.validate(), isFalse);
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
  });

  testWidgets('respects disabled state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: FoundationTheme.light(),
        home: const Scaffold(
          body: FoundationTextField(
            initialValue: 'locked',
            enabled: false,
          ),
        ),
      ),
    );

    expect(
      tester.widget<TextFormField>(find.byType(TextFormField)).enabled,
      isFalse,
    );
  });
}
