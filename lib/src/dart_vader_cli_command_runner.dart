import 'package:cli_completion/cli_completion.dart';
import 'package:dart_vader_cli/src/audio_player/audio_player_platform_factory.dart';
import 'package:dart_vader_cli/src/audio_player/audio_player_service.dart';
import 'package:dart_vader_cli/src/commands/commands.dart';
import 'package:mason_logger/mason_logger.dart' show Logger;

final _audioPlayer = AudioPlayerPlatformFactory.create();

/// {@template dart_vader_cli_command_runner}
/// [DartVaderCliCommandRunner] is a [CompletionCommandRunner] class
/// of the Dart Vader cli.
/// {@endtemplate}
class DartVaderCliCommandRunner extends CompletionCommandRunner<int> {
  /// {@macro dart_vader_cli_command_runner}
  DartVaderCliCommandRunner()
    : _logger = Logger(),
      _audioPlayerService = AudioPlayerService(audioPlayer: _audioPlayer),
      super(_executableName, _description) {
    addCommand(VersionCommand(_logger, _audioPlayerService));
    addCommand(NoCommand(_logger, _audioPlayerService));
    addCommand(ImYourFatherCommand(_logger, _audioPlayerService));
    addCommand(BreathingCommand(_logger, _audioPlayerService));
  }

  final Logger _logger;

  final AudioPlayerService _audioPlayerService;

  static String get _executableName => 'dart-vader';

  static String get _description =>
      '''Darth Vader \u{2015} may the code break with you!''';
}
