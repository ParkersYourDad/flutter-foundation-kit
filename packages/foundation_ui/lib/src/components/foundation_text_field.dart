import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/foundation_colors.dart';
import '../tokens/foundation_radii.dart';
import '../tokens/foundation_spacing.dart';

class FoundationTextField extends StatelessWidget {
  const FoundationTextField({
    this.controller,
    this.initialValue,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.autofocus = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.autovalidateMode,
    this.inputFormatters,
    this.autofillHints,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.semanticCounterText,
    super.key,
  }) : assert(
          controller == null || initialValue == null,
          'Provide either a controller or an initial value, not both.',
        ),
       assert(maxLines == null || maxLines > 0),
       assert(minLines == null || minLines > 0);

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool enableSuggestions;
  final String? semanticCounterText;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<FoundationColors>()!;
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(FoundationRadii.md);

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      autofocus: autofocus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      maxLines: obscureText ? 1 : maxLines,
      minLines: obscureText ? 1 : minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      forceErrorText: errorText,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      style: theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        semanticCounterText: semanticCounterText,
        filled: true,
        fillColor: enabled ? colors.surfaceSubtle : colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: FoundationSpacing.lg,
          vertical: FoundationSpacing.md,
        ),
        labelStyle: theme.textTheme.bodyMedium,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurfaceMuted,
        ),
        helperStyle: theme.textTheme.bodyMedium,
        errorStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.danger,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
        prefixIconColor: colors.onSurfaceMuted,
        suffixIconColor: colors.onSurfaceMuted,
        border: border(colors.outline),
        enabledBorder: border(colors.outline),
        disabledBorder: border(colors.outline.withValues(alpha: 0.5)),
        focusedBorder: border(colors.focus, width: 2),
        errorBorder: border(colors.danger),
        focusedErrorBorder: border(colors.danger, width: 2),
        alignLabelWithHint: maxLines != 1,
      ),
    );
  }
}
