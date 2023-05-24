import 'package:flutter/material.dart';
import 'package:color_palette_app/home_screen.dart';
import 'package:color_palette_app/image_selection_screen.dart';
import 'package:color_palette_app/color_palette_screen.dart';
import 'package:color_palette_app/not_found_screen.dart';

void main() {
  runApp(ColorPaletteApp());
}

class ColorPaletteApp extends StatelessWidget {
  ColorPaletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Palette App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(onImageSelection: handleImageSelection),
        '/image_selection': (context) =>
            ImageSelectionScreen(onImageSelected: handleImageSelected),
        '/color_palette': (context) => ColorPaletteScreen(colors: colorList),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }

  // Define your callback functions and data here
  void handleImageSelection() {
    // Perform actions when an image is selected
  }

  void handleImageSelected(List<Color> selectedColors) {
    // Perform actions after an image is selected
  }

  final List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];
}
