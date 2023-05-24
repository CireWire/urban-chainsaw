import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class ColorPaletteScreen extends StatefulWidget {
  final List<Color> colors;

  ColorPaletteScreen({required this.colors});

  @override
  _ColorPaletteScreenState createState() => _ColorPaletteScreenState();
}

class _ColorPaletteScreenState extends State<ColorPaletteScreen> {
  List<Color> savedColors = [];

  void _copyColorValue(BuildContext context, Color color) {
    final hexValue =
        '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
    Clipboard.setData(ClipboardData(text: hexValue));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Color value copied: $hexValue')),
    );
  }

  void _saveColors() {
    setState(() {
      savedColors = List.from(widget.colors);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Colors saved')),
    );
  }

  void _shareColorPalette() {
    final hexValues = savedColors
        .map((color) =>
            '#${color.value.toRadixString(16).substring(2).toUpperCase()}')
        .toList();

    final String textToShare = 'Color Palette: ${hexValues.join(', ')}';

    Share.share(textToShare);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Palette'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveColors,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _shareColorPalette,
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children: widget.colors.map((color) {
          return GestureDetector(
            onTap: () => _copyColorValue(context, color),
            child: Container(
              color: color,
            ),
          );
        }).toList(),
      ),
    );
  }
}
