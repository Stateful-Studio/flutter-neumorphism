This is a library of basic widgets to use in flutter that utilize neumorphic UI design.

## Features

Included is a set of basic widgets that make it easy to build a application using neumorphism design. As well as a canvas to make updating the base color, associated shadows and light direction of all components in the canvas simple.

The neumorphic library includes the following widgets:
- Canvas
- Container (with option to make animated)
- Button
- Toggle
- Toggle Button

## Getting started

Add the package to your pubspec.yaml file

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
@override
Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: NeumorphicCanvas(
        color: const Color(0xFF2E3440),
        direction: LightDirection.topRight,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
                NeumorphicContainer(
                    height: 100,
                    radius: 100,
                    style: NeumorphicStyle.convex,
                    width: 100,
                ),
                SizedBox(height: 50),
                NeumorphicContainer(
                    height: 100,
                    radius: 50,
                    style: NeumorphicStyle.concave,
                    width: 100,
                ),
                SizedBox(height: 50),
                NeumorphicContainer(
                    height: 100,
                    radius: 100,
                    style: NeumorphicStyle.flat,
                    width: 100,
                    ),
                SizedBox(height: 50),
                NeumorphicContainer(
                    height: 100,
                    radius: 100,
                    style: NeumorphicStyle.pressed,
                    width: 100,
                ),
            ],
        ),
    );
}
```

## Additional information

For any bug or features request please open an issue on GitHub
