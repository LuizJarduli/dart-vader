import 'dart:io';

import 'package:dart_vader_cli/src/audio_player/audio_player.dart';
import 'package:dart_vader_cli/src/audio_player/audio_player_darwin_impl.dart';
import 'package:dart_vader_cli/src/audio_player/audio_player_linux_impl.dart';
import 'package:dart_vader_cli/src/audio_player/audio_player_windows_impl.dart';

/// {@template dart_vader_cli_audio_player_platform_factory}
/// Factory for creating audio player implementations based on the platform.
/// {@endtemplate}
class AudioPlayerPlatformFactory {
  /// {@macro dart_vader_cli_audio_player_platform_factory}
  static AudioPlayer create() {
    try {
      final audioPlayer = _getAudioPlayerImplementation();

      if (audioPlayer == null) {
        throw UnsupportedError(
          'Platform is not supported: ${Platform.operatingSystem}',
        );
      }

      return audioPlayer;
    } on Exception catch (_) {
      rethrow;
    }
  }

  static AudioPlayer? _getAudioPlayerImplementation() {
    final platform = Platform.operatingSystem.toLowerCase();

    final platformImplementations = <String, AudioPlayer>{
      'windows': AudioPlayerWindowsImpl(),
      'macos': AudioPlayerDarwinImpl(),
      'linux': AudioPlayerLinuxImpl(),
    };

    return platformImplementations[platform];
  }
}
