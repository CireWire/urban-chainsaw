import 'package:flutter/material.dart';
import 'package:color_palette_app/home_screen.dart';
import 'package:color_palette_app/image_selection_screen.dart';
import 'package:color_palette_app/color_palette_screen.dart';

void main() {
  runApp(const ColorPaletteApp());
}

class ColorPaletteApp extends StatelessWidget {
  const ColorPaletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Palette App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(
              onImageSelection: () {
                Navigator.pushNamed(context, '/image_selection');
              },
            ),
        '/image_selection': (context) => ImageSelectionScreen(
              onImageSelected: (List<Color> colors) {
                Navigator.pushNamed(context, '/color_palette',
                    arguments: colors);
              },
            ),
        '/color_palette': (context) => ColorPaletteScreen(
              colors: [],
            ),
      },
    );
  }
}
