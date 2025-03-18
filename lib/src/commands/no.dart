import 'package:dart_vader_cli/src/commands/base_audio_player.dart';

/// {@template dart_vader_cli_no_command}
/// Darth Vader says "No" [BaseAudioPlayerCommand]
/// {@endtemplate}
class NoCommand extends BaseAudioPlayerCommand {
  /// {@macro dart_vader_cli_no_command}
  NoCommand(super.logger, super.audioPlayerService);

  @override
  String get assetName => 'dart_vader_no.mp3';

  @override
  String get description => 'Darth Vader says "No"';

  @override
  String get name => 'no';
}
