import 'package:flutter/widgets.dart' hide BoxDecoration, BoxShadow;

import 'package:neumorphic/utilities/direction.dart';
import 'package:neumorphic/utilities/inset.dart';
import 'package:neumorphic/utilities/style.dart';
import 'package:neumorphic/widgets/inherited_canvas.dart';

class NeumorphicContainer extends StatelessWidget {
  const NeumorphicContainer({
    Key? key,
    this.animated,
    this.blurRadius = 20,
    this.child,
    this.clip,
    this.distance = 7,
    this.height,
    this.radius = 50,
    this.spreadRadius = 1,
    this.style = NeumorphicStyle.flat,
    this.width,
  }) : super(key: key);

  // TODO: Add option to add safe area margin (dont allow elements to overlap with shadow)
  final bool? animated;
  final double blurRadius;
  final Widget? child;
  final Clip? clip;
  final double distance;
  final double? height;
  final double radius;
  final double spreadRadius;
  final NeumorphicStyle style;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (animated ?? false) {
      return _AnimatedContainer(
        blurRadius: blurRadius,
        child: child,
        clip: clip,
        distance: distance,
        height: height,
        radius: radius,
        spreadRadius: spreadRadius,
        style: style,
        width: width,
      );
    }

    return LayoutBuilder(builder: (context, constraints) {
      return _Container(
        blurRadius: blurRadius,
        child: child,
        clip: clip,
        distance: distance,
        height: height,
        radius: radius,
        spreadRadius: spreadRadius,
        style: style,
        width: width,
      );
    });
  }
}

class _AnimatedContainer extends StatelessWidget {
  const _AnimatedContainer({
    Key? key,
    this.blurRadius = 20,
    this.child,
    this.clip,
    this.distance = 7,
    this.height,
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
  final double radius;
  final double spreadRadius;
  final NeumorphicStyle style;
  final double? width;

  Gradient gradient(BuildContext context) {
    LightDirection direction = InheritedCanvas.of(context).direction;

    switch (style) {
      case NeumorphicStyle.concave:
        return LinearGradient(
          colors: [
            InheritedCanvas.of(context).gradientHighlight,
            InheritedCanvas.of(context).gradientShadow,
          ],
          begin: direction.shadowAlign,
          end: direction.highlightAlign,
        );
      case NeumorphicStyle.convex:
        return LinearGradient(
          colors: [
            InheritedCanvas.of(context).gradientHighlight,
            InheritedCanvas.of(context).gradientShadow,
          ],
          begin: direction.highlightAlign,
          end: direction.shadowAlign,
        );
      default:
        return LinearGradient(
          colors: [
            InheritedCanvas.of(context).color,
            InheritedCanvas.of(context).color,
          ],
          begin: direction.highlightAlign,
          end: direction.shadowAlign,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    LightDirection direction = InheritedCanvas.of(context).direction;

    return AnimatedContainer(
      clipBehavior: clip ?? Clip.hardEdge,
      duration: const Duration(milliseconds: 50),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: InheritedCanvas.of(context).color,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        boxShadow: [
          if (style != NeumorphicStyle.none) ...[
            BoxShadow(
              blurRadius: blurRadius,
              color: InheritedCanvas.of(context).highlight,
              inset: style == NeumorphicStyle.pressed ||
                  style == NeumorphicStyle.deepPressed,
              offset: direction.highlightOffset(distance),
              spreadRadius:
                  spreadRadius + (style == NeumorphicStyle.deepPressed ? 5 : 0),
            ),
            BoxShadow(
              blurRadius: blurRadius,
              color: InheritedCanvas.of(context).shadow,
              inset: style == NeumorphicStyle.pressed ||
                  style == NeumorphicStyle.deepPressed,
              offset: direction.shadowOffset(distance),
              spreadRadius:
                  spreadRadius + (style == NeumorphicStyle.deepPressed ? 5 : 0),
            ),
          ],
        ],
        gradient: gradient(context),
      ),
      child: child,
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({
    Key? key,
    this.blurRadius = 20,
    this.child,
    this.clip,
    this.distance = 7,
    this.height,
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
  final double radius;
  final double spreadRadius;
  final NeumorphicStyle style;
  final double? width;

  Gradient gradient(BuildContext context) {
    LightDirection direction = InheritedCanvas.of(context).direction;

    switch (style) {
      case NeumorphicStyle.concave:
        return LinearGradient(
          colors: [
            InheritedCanvas.of(context).gradientHighlight,
            InheritedCanvas.of(context).gradientShadow,
          ],
          begin: direction.shadowAlign,
          end: direction.highlightAlign,
        );
      case NeumorphicStyle.convex:
        return LinearGradient(
          colors: [
            InheritedCanvas.of(context).gradientHighlight,
            InheritedCanvas.of(context).gradientShadow,
          ],
          begin: direction.highlightAlign,
          end: direction.shadowAlign,
        );
      default:
        return LinearGradient(
          colors: [
            InheritedCanvas.of(context).color,
            InheritedCanvas.of(context).color,
          ],
          begin: direction.highlightAlign,
          end: direction.shadowAlign,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    LightDirection direction = InheritedCanvas.of(context).direction;

    return Container(
      clipBehavior: clip ?? Clip.hardEdge,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: InheritedCanvas.of(context).color,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        boxShadow: [
          if (style != NeumorphicStyle.none) ...[
            BoxShadow(
              blurRadius: blurRadius,
              color: InheritedCanvas.of(context).highlight,
              inset: style == NeumorphicStyle.pressed,
              offset: direction.highlightOffset(distance),
              spreadRadius: spreadRadius,
            ),
            BoxShadow(
              blurRadius: blurRadius,
              color: InheritedCanvas.of(context).shadow,
              inset: style == NeumorphicStyle.pressed,
              offset: direction.shadowOffset(distance),
              spreadRadius: spreadRadius,
            ),
          ],
        ],
        gradient: gradient(context),
      ),
      child: child,
    );
  }
}
