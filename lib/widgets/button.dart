import 'package:flutter/material.dart';

import 'package:neumorphic/utilities/style.dart';
import 'package:neumorphic/widgets/container.dart';

class NeumorphicButton extends StatefulWidget {
  const NeumorphicButton({
    Key? key,
    this.blurRadius = 20,
    this.child,
    this.clip,
    this.distance = 7,
    this.height,
    required this.onTap,
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
  final Function onTap;
  final double radius;
  final double spreadRadius;
  final NeumorphicStyle style;
  final double? width;

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  late NeumorphicStyle style;

  @override
  void initState() {
    style = widget.style;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant NeumorphicButton oldWidget) {
    if (oldWidget.style != widget.style) {
      setState(() => style = widget.style);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        setState(() => style = widget.style);
      },
      onTapDown: (_) {
        setState(() {
          switch (widget.style) {
            case NeumorphicStyle.flat:
              style = NeumorphicStyle.none;
              break;
            case NeumorphicStyle.concave:
              style = NeumorphicStyle.none;
              break;
            case NeumorphicStyle.convex:
              style = NeumorphicStyle.none;
              break;
            case NeumorphicStyle.none:
              style = NeumorphicStyle.pressed;
              break;
            default:
              style = NeumorphicStyle.deepPressed;
              break;
          }
        });
      },
      onTapUp: (_) {
        setState(() => style = widget.style);
        widget.onTap();
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
