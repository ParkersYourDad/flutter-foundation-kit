import 'package:flutter/material.dart';

import '../theme/foundation_colors.dart';
import '../tokens/foundation_radii.dart';
import '../tokens/foundation_spacing.dart';

class FoundationSurface extends StatelessWidget {
  const FoundationSurface({
    required this.child,
    this.padding = const EdgeInsets.all(FoundationSpacing.lg),
    this.color,
    this.borderColor,
    this.radius = FoundationRadii.lg,
    this.borderWidth = 1,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Color? borderColor;
  final double radius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<FoundationColors>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? colors.surface,
        borderRadius: BorderRadius.circular(radius),
        border: borderColor == null
            ? null
            : Border.all(color: borderColor!, width: borderWidth),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
