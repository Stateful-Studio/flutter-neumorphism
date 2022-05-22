import 'package:flutter/widgets.dart';

enum LightDirection {
  bottomLeft,
  bottomRight,
  topLeft,
  topRight,
}

extension LightExtension on LightDirection {
  Alignment get highlightAlign {
    switch (this) {
      case LightDirection.bottomLeft:
        return Alignment.bottomLeft;
      case LightDirection.bottomRight:
        return Alignment.bottomRight;
      case LightDirection.topLeft:
        return Alignment.topLeft;
      default:
        return Alignment.topRight;
    }
  }

  Offset highlightOffset(double distance) {
    switch (this) {
      case LightDirection.bottomLeft:
        return Offset(-distance, distance);
      case LightDirection.bottomRight:
        return Offset(distance, distance);
      case LightDirection.topLeft:
        return Offset(-distance, -distance);
      default:
        return Offset(distance, -distance);
    }
  }

  Alignment get shadowAlign {
    switch (this) {
      case LightDirection.bottomLeft:
        return Alignment.topRight;
      case LightDirection.bottomRight:
        return Alignment.topLeft;
      case LightDirection.topLeft:
        return Alignment.bottomRight;
      default:
        return Alignment.bottomLeft;
    }
  }

  Offset shadowOffset(double distance) {
    switch (this) {
      case LightDirection.bottomLeft:
        return Offset(distance, -distance);
      case LightDirection.bottomRight:
        return Offset(-distance, -distance);
      case LightDirection.topLeft:
        return Offset(distance, distance);
      default:
        return Offset(-distance, distance);
    }
  }
}
