import 'dart:io';

import 'package:dart_vader_cli/src/audio_player/audio_player.dart';
import 'package:dart_vader_cli/src/binary_asset/binary_asset_service.dart';

/// {@template dart_vader_cli_audio_player_service}
/// Service for playing audio assets.
/// {@endtemplate}
class AudioPlayerService {
  /// {@macro dart_vader_cli_audio_player_service}
  AudioPlayerService({required this.audioPlayer});

  /// The audio player instance
  final AudioPlayer audioPlayer;

  /// Plays the audio asset
  ///
  /// Throws [_MissingAssetException] if the asset file doesn't exist
  /// Throws [_AudioPlaybackException] if the audio playback fails
  Future<void> play(String assetName) async {
    try {
      final File(:path) = await BinaryAssetService.getAssetPath(assetName);
      final exitCode = await audioPlayer.play(path);

      switch (exitCode) {
        case 0:
          return;
        case 72:
          throw const _MissingAssetException();
        default:
          throw _AudioPlaybackException(
            'Failed to play audio with exit code $exitCode: $path',
          );
      }
    } on Exception catch (_) {
      rethrow;
    }
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
