import 'dart:io';

import 'package:dart_vader_cli/src/audio_player/audio_player.dart';

/// {@template dart_vader_cli_audio_player_linux_impl}
/// Implementation of the [AudioPlayer] interface for Linux.
/// {@endtemplate}
class AudioPlayerLinuxImpl implements AudioPlayer {
  @override
  Future<int> play(String assetPath) async {
    final ProcessResult(:exitCode) = await Process.run('ffplay', [
      '-nodisp',
      '-autoexit',
      '-loglevel',
      'quiet',
      assetPath,
    ]);

    return exitCode;
  }
}
