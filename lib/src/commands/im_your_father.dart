import 'package:dart_vader_cli/src/commands/base_audio_player.dart';
import 'package:dart_vader_cli/src/constants/audio_assets.dart';

/// {@template dart_vader_cli_im_your_father_command}
/// Darth Vader says "I am your father" [BaseAudioPlayerCommand]
/// {@endtemplate}
class ImYourFatherCommand extends BaseAudioPlayerCommand {
  /// {@macro dart_vader_cli_im_your_father_command}
  ImYourFatherCommand(super.logger, super.audioPlayerService);

  @override
  String get assetName => AOTAssets.vaderImYourFatherKey;

  @override
  String get description => 'Darth Vader says "I am your father"';

  @override
  String get name => 'im-your-father';
}
