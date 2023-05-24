import 'dart:io';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<List<Color>> extractColors(File imageFile) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(
    FileImage(imageFile),
    maximumColorCount: 20,
  );
  return paletteGenerator.colors.toList();
}
