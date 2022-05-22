enum NeumorphicStyle {
  concave,
  convex,
  deepPressed,
  flat,
  none,
  pressed,
}

extension StyleExtension on NeumorphicStyle {
  bool get usesGradient {
    if (this == NeumorphicStyle.concave || this == NeumorphicStyle.convex) {
      return true;
    } else {
      return false;
    }
  }
}
