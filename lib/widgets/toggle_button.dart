import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:neumorphic/utilities/style.dart';
import 'package:neumorphic/widgets/container.dart';

class NeumorphicToggleButton extends StatefulWidget {
  const NeumorphicToggleButton({
    Key? key,
    this.blurRadius = 20,
    this.child,
    this.clip,
    this.distance = 7,
    this.height,
    required this.onToggle,
    this.radius = 20,
    this.spreadRadius = 1,
    this.style = NeumorphicStyle.flat,
    this.width,
  }) : super(key: key);

  final double blurRadius;
  final Widget? child;
  final Clip? clip;
  final double distance;
  final double? height;
  final Function(bool) onToggle;
  final double radius;
  final double spreadRadius;
  final NeumorphicStyle style;
  final double? width;

  @override
  State<NeumorphicToggleButton> createState() => _NeumorphicToggleButtonState();
}

class _NeumorphicToggleButtonState extends State<NeumorphicToggleButton> {
  late NeumorphicStyle style;

  bool toggled = false;

  @override
  void initState() {
    style = widget.style;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NeumorphicToggleButton oldWidget) {
    if (oldWidget.style != widget.style) {
      setState(() {
        style = widget.style;
        toggled = false;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        setState(() {
          style = toggled ? widget.style : NeumorphicStyle.pressed;
        });
      },
      onTapDown: (_) {
        setState(() {
          style = NeumorphicStyle.deepPressed;
        });
      },
      onTapUp: (_) {
        setState(() {
          toggled = !toggled;
          style = toggled ? NeumorphicStyle.pressed : widget.style;
        });
        widget.onToggle(toggled);
      },
      child: NeumorphicContainer(
        animated: true,
        blurRadius: widget.blurRadius,
        child: widget.child,
        clip: widget.clip,
        distance: widget.distance,
        height: widget.height,
        radius: widget.radius,
        spreadRadius: widget.spreadRadius,
        style: style,
        width: widget.width,
      ),
    );
  }
}
