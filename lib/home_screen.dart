import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function onImageSelection;

  const HomeScreen({super.key, required this.onImageSelection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Palette App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                onImageSelection();
              },
              child: const Icon(
                Icons.image,
                size: 100,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Color Palette App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onImageSelection();
              },
              child: const Text('Select an Image'),
            ),
          ],
        ),
      ),
    );
  }
}
