import 'dart:io';

import 'package:dart_vader_cli/src/constants/audio_assets.dart';
import 'package:path/path.dart' as p;

/// {@template binary_asset_service}
/// A service for managing binary assets.
/// {@endtemplate}
class BinaryAssetService {
  /// Get the path to the asset.
  ///
  /// [key] is the key of the asset to get.
  ///
  /// Throws [ArgumentError] if the asset is not found.
  static Future<File> getAssetPath(String key) async {
    final assetMap = AOTAssets.assetMap;
    final asset = assetMap[key];
    final tempDir = Directory.systemTemp;
    final tempFile = File(
      p.join(
        tempDir.path,
        'vader_${DateTime.now().millisecondsSinceEpoch}.mp3',
      ),
    );

    if (asset == null) {
      throw ArgumentError('Asset not found: $key');
    }

    try {
      await tempFile.writeAsBytes(asset);
      return tempFile;
    } catch (e) {
      throw FormatException('Failed to write audio file: $e');
    }
  }
}
