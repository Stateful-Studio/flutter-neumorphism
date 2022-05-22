import 'package:flutter/widgets.dart';

import 'package:neumorphic/utilities/direction.dart';

class InheritedCanvas extends InheritedWidget {
  const InheritedCanvas({
    Key? key,
    required Widget child,
    required this.color,
    required this.direction,
    required this.gradientHighlight,
    required this.gradientShadow,
    required this.highlight,
    required this.shadow,
  }) : super(key: key, child: child);

  final Color color;
  final LightDirection direction;
  final Color gradientHighlight;
  final Color gradientShadow;
  final Color highlight;
  final Color shadow;

  static InheritedCanvas of(BuildContext context) {
    final InheritedCanvas? result =
        context.dependOnInheritedWidgetOfExactType<InheritedCanvas>();
    assert(
      result != null,
      'Neumorphic widgets must be places inside a NeumorphicCanvas',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedCanvas oldWidget) {
    return color != oldWidget.color || direction != oldWidget.direction;
  }
}
