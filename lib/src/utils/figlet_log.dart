import 'dart:io';

import 'package:enough_ascii_art/enough_ascii_art.dart' show Font, renderFiglet;
import 'package:path/path.dart' as p;

/// {@template dart_vader_cli_figlet}
/// A wrapper class for ASCII art rendering functionality
/// {@endtemplate}
class FigletLog {
  static Future<Font> _retrieveFont() async {
    final assetsDir = p.join(
      p.dirname(p.dirname(Platform.script.toFilePath())),
      'assets',
    );
    final file = await File(p.join(assetsDir, 'doom.flf')).readAsString();
    return Font.text(file);
  }

  /// Renders the given [text] as ASCII art
  ///
  /// Returns a String containing the rendered ASCII art
  static Future<String> getText(String text, [Font? font]) async {
    try {
      final effectiveFont = font ?? await _retrieveFont();
      return renderFiglet(text, font ?? effectiveFont);
    } on PathNotFoundException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw Exception('Error rendering figlet: $e');
    }
  }
}
