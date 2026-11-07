import 'package:flutter/material.dart';

import '../theme/foundation_colors.dart';
import '../tokens/foundation_radii.dart';
import '../tokens/foundation_spacing.dart';

enum FoundationButtonVariant { primary, secondary, outline, destructive }

enum FoundationButtonSize { compact, regular, large }

class FoundationButton extends StatelessWidget {
  const FoundationButton({
    required this.label,
    required this.onPressed,
    this.variant = FoundationButtonVariant.primary,
    this.size = FoundationButtonSize.regular,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.semanticLabel,
    this.loadingSemanticValue,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final FoundationButtonVariant variant;
  final FoundationButtonSize size;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final String? semanticLabel;
  final String? loadingSemanticValue;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<FoundationColors>()!;
    final isEnabled = onPressed != null && !isLoading;
    final background = _background(colors, isEnabled);
    final foreground = _foreground(colors, isEnabled);
    final minHeight = switch (size) {
      FoundationButtonSize.compact => 48.0,
      FoundationButtonSize.regular => 52.0,
      FoundationButtonSize.large => 56.0,
    };
    final horizontalPadding = switch (size) {
      FoundationButtonSize.compact => FoundationSpacing.md,
      FoundationButtonSize.regular => FoundationSpacing.lg,
      FoundationButtonSize.large => FoundationSpacing.xxl,
    };
    final radius = BorderRadius.circular(FoundationRadii.md);

    return Semantics(
      button: true,
      enabled: isEnabled,
      label: semanticLabel ?? label,
      value: isLoading ? loadingSemanticValue : null,
      child: ExcludeSemantics(
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              color: background,
              borderRadius: radius,
              border: variant == FoundationButtonVariant.outline
                  ? Border.all(
                      color: isEnabled
                          ? colors.outline
                          : colors.outline.withValues(alpha: 0.5),
                    )
                  : null,
            ),
            child: InkWell(
              onTap: isEnabled ? onPressed : null,
              borderRadius: radius,
              focusColor: colors.focus.withValues(alpha: 0.12),
              hoverColor: foreground.withValues(alpha: 0.06),
              splashColor: foreground.withValues(alpha: 0.12),
              highlightColor: foreground.withValues(alpha: 0.06),
              child: Container(
                constraints: BoxConstraints(minHeight: minHeight),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: FoundationSpacing.sm,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoading)
                      SizedBox(
                        width: FoundationSpacing.lg,
                        height: FoundationSpacing.lg,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: foreground,
                        ),
                      )
                    else if (leading != null) ...[
                      IconTheme(
                        data: IconThemeData(
                          color: foreground,
                          size: FoundationSpacing.lg,
                        ),
                        child: leading!,
                      ),
                      const SizedBox(width: FoundationSpacing.sm),
                    ],
                    Flexible(
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: foreground,
                            ),
                      ),
                    ),
                    if (!isLoading && trailing != null) ...[
                      const SizedBox(width: FoundationSpacing.sm),
                      IconTheme(
                        data: IconThemeData(
                          color: foreground,
                          size: FoundationSpacing.lg,
                        ),
                        child: trailing!,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _background(FoundationColors colors, bool enabled) {
    if (!enabled) return colors.surfaceSubtle;
    return switch (variant) {
      FoundationButtonVariant.primary => colors.primary,
      FoundationButtonVariant.secondary => colors.secondary,
      FoundationButtonVariant.outline => colors.surface,
      FoundationButtonVariant.destructive => colors.danger,
    };
  }

  Color _foreground(FoundationColors colors, bool enabled) {
    if (!enabled) return colors.onSurfaceMuted;
    return switch (variant) {
      FoundationButtonVariant.primary => colors.onPrimary,
      FoundationButtonVariant.secondary => colors.onSecondary,
      FoundationButtonVariant.outline => colors.onSurface,
      FoundationButtonVariant.destructive => colors.onDanger,
    };
  }
}
