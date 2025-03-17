import 'dart:io';

import 'package:enough_ascii_art/enough_ascii_art.dart' show Font, renderFiglet;

/// {@template dart_vader_cli_figlet}
/// A wrapper class for ASCII art rendering functionality
/// {@endtemplate}
class FigletLog {
  static Future<Font> _retrieveFont() async {
    final file = await File('lib/src/assets/doom.flf').readAsString();
    return Font.text(file);
  }

  /// Renders the given [text] as ASCII art
  ///
  /// Returns a String containing the rendered ASCII art
  static Future<String> getText(String text, [Font? font]) async {
    final effectiveFont = font ?? await _retrieveFont();
    return renderFiglet(text, font ?? effectiveFont);
  }
}
