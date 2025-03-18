import 'dart:io';

import 'package:dart_vader_cli/src/audio_player/audio_player.dart';

/// {@template dart_vader_cli_audio_player_darwin_impl}
/// Implementation of the [AudioPlayer] interface for Darwin.
/// {@endtemplate}
class AudioPlayerDarwinImpl implements AudioPlayer {
  @override
  Future<int> play(String assetPath) async {
    final ProcessResult(:exitCode) = await Process.run('afplay', [assetPath]);

    return exitCode;
  }
}
