import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/widgets.dart';

class ImageSelectionScreen extends StatelessWidget {
  final Function(List<Color>) onImageSelected;

  const ImageSelectionScreen({Key? key, required this.onImageSelected})
      : super(key: key);

  Future<List<Color>> processImage(File imageFile) async {
    try {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        FileImage(imageFile),
        maximumColorCount: 20,
      );
      return paletteGenerator.colors.toList();
    } catch (e) {
      throw PlatformException(
        code: 'ImageProcessingError',
        message: 'Error processing the selected image.',
      );
    }
  }

  Future<void> _selectFromGallery(BuildContext context) async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final file = File(pickedImage.path);

        // Check file extension or MIME type
        final extension = path.extension(file.path);
        if (!['.jpg', '.jpeg', '.png'].contains(extension.toLowerCase())) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Invalid Image'),
              content: const Text('Only JPEG and PNG images are supported.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          return;
        }

        // Check file size
        if (file.lengthSync() > 10 * 1024 * 1024) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Invalid Image'),
              content: const Text('Image size should not exceed 10MB.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          return;
        }

        final colors = await processImage(file);
        onImageSelected(colors);
      } else {
        // Handle case when no image is selected
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error'),
            content: const Text('No image selected.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'An error occurred.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _takePhoto(BuildContext context) async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        final file = File(pickedImage.path);

        // Check file extension or MIME type
        final extension = path.extension(file.path);
        if (!['.jpg', '.jpeg', '.png'].contains(extension.toLowerCase())) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Invalid Image'),
              content: const Text('Only JPEG and PNG images are supported.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          return;
        }

        // Check file size
        if (file.lengthSync() > 10 * 1024 * 1024) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Invalid Image'),
              content: const Text('Image size should not exceed 10MB.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          return;
        }

        final colors = await processImage(file);
        onImageSelected(colors);
      } else {
        // Handle case when no image is selected
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error'),
            content: const Text('No image selected.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.message ?? 'An error occurred.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectFromGallery(context),
              child: const Text('Select from Gallery'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _takePhoto(context),
              child: const Text('Take a Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
