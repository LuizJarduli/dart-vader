import 'dart:io';

import 'package:dart_vader_cli/src/audio_player/audio_player.dart';
import 'package:path/path.dart' as p;

/// {@template dart_vader_cli_audio_player_service}
/// Service for playing audio assets.
/// {@endtemplate}
class AudioPlayerService {
  /// {@macro dart_vader_cli_audio_player_service}
  AudioPlayerService({required this.audioPlayer});

  /// The audio player instance
  final AudioPlayer audioPlayer;

  /// The absolute path to the audio asset file
  /// Constructs path based on current directory and asset name
  String _absoluteAssetPath(String assetPath) {
    // Get the directory of the current script or executable
    final scriptDir = p.dirname(Platform.script.toFilePath());

    // Go up from bin to root directory
    final rootDir = p.join(scriptDir, 'assets');

    return p.join(rootDir, assetPath);
  }

  /// Plays the audio asset
  ///
  /// Throws [_MissingAssetException] if the asset file doesn't exist
  /// Throws [_AudioPlaybackException] if the audio playback fails
  Future<void> play(String assetName) async {
    try {
      final assetPath = await _validateAsset(assetName);
      final exitCode = await audioPlayer.play(assetPath);

      switch (exitCode) {
        case 0:
          return;
        case 72:
          throw const _MissingAssetException();
        default:
          throw _AudioPlaybackException(
            'Failed to play audio with exit code $exitCode: $assetPath',
          );
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Validates and plays the audio asset
  ///
  /// Throws [_MissingAssetException] if the asset file doesn't exist
  Future<String> _validateAsset(String assetName) async {
    final assetPath = _absoluteAssetPath(assetName);

    if (!File(assetPath).existsSync()) {
      throw const _MissingAssetException();
    }

    return assetPath;
  }
}

class _MissingAssetException implements Exception {
  const _MissingAssetException();

  @override
  String toString() => 'Missing asset';
}

class _AudioPlaybackException implements Exception {
  _AudioPlaybackException(this.message);

  final String message;
}
