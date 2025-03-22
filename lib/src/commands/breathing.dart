import 'package:dart_vader_cli/src/commands/base_audio_player.dart';
import 'package:dart_vader_cli/src/constants/audio_assets.dart';

/// {@template dart_vader_cli_breathing_command}
/// Darth Vader breathing [BaseAudioPlayerCommand]
/// {@endtemplate}
class BreathingCommand extends BaseAudioPlayerCommand {
  /// {@macro dart_vader_cli_breathing_command}
  BreathingCommand(super.logger, super.audioPlayerService);

  @override
  String get assetName => AOTAssets.vaderBreathingKey;

  @override
  String get description => 'Darth Vader breathing';

  @override
  String get name => 'breathing';
}
