import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:neumorphic/utilities/style.dart';
import 'package:neumorphic/widgets/container.dart';

class NeumorphicToggle extends StatefulWidget {
  const NeumorphicToggle({
    Key? key,
    this.blurRadius,
    this.distance = 7,
    this.enabledColor,
    required this.onToggle,
    this.spreadRadius = 1,
  }) : super(key: key);

  final double? blurRadius;
  final double distance;
  final Color? enabledColor;
  final Function(bool) onToggle;
  final double spreadRadius;

  @override
  State<NeumorphicToggle> createState() => _NeumorphicToggleState();
}

class _NeumorphicToggleState extends State<NeumorphicToggle> {
  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => toggled = !toggled);
        widget.onToggle(toggled);
      },
      child: NeumorphicContainer(
        radius: 100,
        style: NeumorphicStyle.pressed,
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 100),
                    alignment:
                        toggled ? Alignment.centerRight : Alignment.centerLeft,
                    child: NeumorphicContainer(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        color: toggled
                            ? widget.enabledColor ??
                                Colors.green.withOpacity(.2)
                            : Colors.transparent,
                      ),
                      distance: 2,
                      blurRadius: 2,
                      width: constraints.maxHeight - 10,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
