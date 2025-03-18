import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dart_vader_cli/src/audio_player/audio_player_service.dart';
import 'package:mason_logger/mason_logger.dart' show ExitCode, Logger;
import 'package:meta/meta.dart';

/// {@template dart_vader_cli_base_audio_player_command}
/// Base class for audio player commands that handles playing audio assets.
/// Provides common functionality for audio playback while allowing specific
/// implementations through subclasses.
/// {@endtemplate}
abstract class BaseAudioPlayerCommand extends Command<int> {
  /// {@macro dart_vader_cli_base_audio_player_command}
  BaseAudioPlayerCommand(this._logger, this._audioPlayerService);

  /// The name of the audio asset file to be played.
  /// Must be implemented by subclasses to specify which audio file to use.
  @protected
  @mustBeOverridden
  String get assetName;

  /// The audio player service instance
  @protected
  final AudioPlayerService _audioPlayerService;

  /// Logger instance used for output and status messages
  @protected
  final Logger _logger;

  /// Executes the platform-specific audio playback command
  /// Must be implemented by subclasses to handle actual audio playback
  @protected
  Future<void> playCommand() async {
    return _audioPlayerService.play(assetName);
  }

  @override
  FutureOr<int> run() async {
    try {
      await playCommand();
      return ExitCode.success.code;
    } on Exception catch (e) {
      _logger.alert('Error playing audio: $e');
      return ExitCode.software.code;
    }
  }
}
