import 'package:flutter/animation.dart';

abstract final class FoundationMotion {
  static const Duration instant = Duration(milliseconds: 80);
  static const Duration fast = Duration(milliseconds: 140);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration deliberate = Duration(milliseconds: 280);

  static const Curve standard = Curves.easeInOutCubic;
  static const Curve emphasized = Curves.easeOutCubic;
}
