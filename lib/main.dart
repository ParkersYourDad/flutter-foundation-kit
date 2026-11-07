import 'package:flutter/material.dart';
import 'package:foundation_ui/foundation_ui.dart';

void main() {
  runApp(const FoundationKitApp());
}

class FoundationKitApp extends StatelessWidget {
  const FoundationKitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foundation Kit',
      theme: FoundationTheme.light(),
      darkTheme: FoundationTheme.dark(),
      themeMode: ThemeMode.system,
      home: const DesignSystemShowcasePage(),
    );
  }
}

class DesignSystemShowcasePage extends StatelessWidget {
  const DesignSystemShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<FoundationColors>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Foundation UI'),
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(FoundationSpacing.xxl),
        children: [
          Text(
            'First-party foundations',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: FoundationSpacing.sm),
          Text(
            'A neutral, brandable starting point for Flutter applications.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: FoundationSpacing.xxxl),
          Text('Buttons', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: FoundationSpacing.lg),
          const Wrap(
            spacing: FoundationSpacing.sm,
            runSpacing: FoundationSpacing.sm,
            children: [
              FoundationButton(label: 'Primary', onPressed: _noop),
              FoundationButton(
                label: 'Secondary',
                variant: FoundationButtonVariant.secondary,
                onPressed: _noop,
              ),
              FoundationButton(
                label: 'Outline',
                variant: FoundationButtonVariant.outline,
                onPressed: _noop,
              ),
              FoundationButton(
                label: 'Destructive',
                variant: FoundationButtonVariant.destructive,
                onPressed: _noop,
              ),
              FoundationButton(label: 'Disabled', onPressed: null),
              FoundationButton(
                label: 'Loading',
                onPressed: _noop,
                isLoading: true,
                loadingSemanticValue: 'Loading',
              ),
            ],
          ),
          const SizedBox(height: FoundationSpacing.xxxl),
          Text('Text fields', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: FoundationSpacing.lg),
          const FoundationTextField(
            labelText: 'Email address',
            hintText: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: [AutofillHints.email],
          ),
          const SizedBox(height: FoundationSpacing.lg),
          const FoundationTextField(
            labelText: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            textInputAction: TextInputAction.done,
            suffix: Icon(Icons.visibility_outlined),
          ),
          const SizedBox(height: FoundationSpacing.xxxl),
          Text('Surfaces', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: FoundationSpacing.lg),
          FoundationSurface(
            borderColor: colors.outline,
            child: const Text('Surface with a semantic border.'),
          ),
          const SizedBox(height: FoundationSpacing.lg),
          FoundationSurface(
            color: colors.surfaceSubtle,
            child: Text(
              'Subtle surface',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

void _noop() {}
