import 'dart:math';

import 'package:flutter/widgets.dart';

import 'package:neumorphic/utilities/direction.dart';
import 'package:neumorphic/widgets/inherited_canvas.dart';

class NeumorphicCanvas extends StatefulWidget {
  const NeumorphicCanvas({
    Key? key,
    required this.child,
    required this.color,
    this.direction = LightDirection.topLeft,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final LightDirection direction;

  @override
  State<NeumorphicCanvas> createState() => _NeumorphicCanvasState();
}

class _NeumorphicCanvasState extends State<NeumorphicCanvas> {
  late Color color;
  late LightDirection direction;
  late Color gradientHighlight;
  late Color gradientShadow;
  late Color highlight;
  late Color shadow;

  @override
  void initState() {
    color = widget.color;
    direction = widget.direction;

    calculateColorPalate();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NeumorphicCanvas oldWidget) {
    if (oldWidget.color != widget.color ||
        oldWidget.direction != widget.direction ||
        oldWidget.child != widget.child) {
      setState(() {
        color = widget.color;
        direction = widget.direction;
        calculateColorPalate();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  calculateColorPalate() {
    gradientHighlight = getColorWithLuminanceDiff(color, 0.02);
    gradientShadow = getColorWithLuminanceDiff(color, -0.02);
    highlight = getColorWithLuminanceDiff(color, 0.04);
    shadow = getColorWithLuminanceDiff(color, -0.04);
  }

  Color getColorWithLuminanceDiff(Color color, double increment) {
    HSLColor hslColor = HSLColor.fromColor(color);
    double newValue = min(max(hslColor.lightness + increment, 0.0), 1.0);
    return hslColor.withLightness(newValue).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: InheritedCanvas(
        child: widget.child,
        color: color,
        direction: direction,
        gradientHighlight: gradientHighlight,
        gradientShadow: gradientShadow,
        highlight: highlight,
        shadow: shadow,
      ),
    );
  }
}
