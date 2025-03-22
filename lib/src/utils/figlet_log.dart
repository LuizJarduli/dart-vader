import 'dart:io';

import 'package:dart_vader_cli/src/binary_asset/binary_asset_service.dart';
import 'package:dart_vader_cli/src/constants/audio_assets.dart';
import 'package:enough_ascii_art/enough_ascii_art.dart' show Font, renderFiglet;

/// {@template dart_vader_cli_figlet}
/// A wrapper class for ASCII art rendering functionality
/// {@endtemplate}
class FigletLog {
  static Future<Font> _retrieveFont() async {
    final file = await BinaryAssetService.getAssetPath(AOTAssets.doomKey);
    final font = await file.readAsString();
    return Font.text(font);
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
