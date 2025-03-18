import 'dart:io';

import 'package:dart_vader_cli/src/audio_player/audio_player.dart';

/// {@template dart_vader_cli_audio_player_windows_impl}
/// Implementation of the [AudioPlayer] interface for Windows.
/// {@endtemplate}
class AudioPlayerWindowsImpl implements AudioPlayer {
  @override
  Future<int> play(String assetPath) async {
    // Use Windows Media Player CLI to play the audio file
    // REFACTOR: Create a VBScript to play entirely headless
    final ProcessResult(:exitCode) = await Process.run('cmd.exe', [
      '/c',
      'start',
      'wmplayer',
      assetPath,
      '/play',
      '/close',
    ]);

    return exitCode;
  }
}
