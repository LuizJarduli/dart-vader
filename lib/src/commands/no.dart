import 'package:dart_vader_cli/src/commands/base_audio_player.dart';
import 'package:dart_vader_cli/src/constants/audio_assets.dart';

/// {@template dart_vader_cli_no_command}
/// Darth Vader says "No" [BaseAudioPlayerCommand]
/// {@endtemplate}
class NoCommand extends BaseAudioPlayerCommand {
  /// {@macro dart_vader_cli_no_command}
  NoCommand(super.logger, super.audioPlayerService);

  @override
  String get assetName => AOTAssets.vaderNoKey;

  @override
  String get description => 'Darth Vader says "No"';

  @override
  String get name => 'no';
}
