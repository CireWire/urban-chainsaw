# Color Palette App

The Color Palette App is a Flutter application that allows users to select an image and extract color palettes from the image. Users can then view and interact with the generated color palettes.

## Features

- Image Selection: Users can select an image from their gallery or take a photo using the device's camera.
- Color Extraction: The app processes the selected image to extract color palettes using the Palette Generator package.
- Color Palette Display: The extracted color palettes are displayed as a grid of colors.
- Interaction: Users can tap on a color to copy its value to the clipboard.
- Save Colors: Users can save the color palette for later use.
- Share Colors: Users can share the color palette with others through various means.


## Getting Started

To get started with the Color Palette App, follow these steps:

1. Clone the repository: `git clone https://github.com/CireWire/urban-chainsaw.git`
2. Change to the project directory: `cd color-palette-app`
3. Install the dependencies: `flutter pub get`
4. Run the app: `flutter run`

Make sure you have Flutter and Dart installed on your development machine.

## Dependencies

The Color Palette App relies on the following dependencies:

- `flutter/material.dart`: The Material Design framework for Flutter.
- `flutter/services.dart`: Flutter services, including clipboard access.
- `image_picker/image_picker.dart`: Plugin for picking images from the device's gallery or camera.
- `palette_generator/palette_generator.dart`: Library for color palette extraction.
- `share/share.dart`: Package for sharing content through various platforms.

For more details, check the `pubspec.yaml` file.

## Contributing

Contributions to the Color Palette App are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

The Color Palette App is open-source software licensed under the [MIT License](LICENSE).
