import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_vader_cli/src/commands/base_audio_player.dart';
import 'package:dart_vader_cli/src/utils/figlet_log.dart';
import 'package:dart_vader_cli/src/version.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template dart_vader_cli_version}
/// Dart vader cli display version [Command].
/// {@endtemplate}
class VersionCommand extends BaseAudioPlayerCommand {
  /// {@macro dart_vader_cli_version}
  VersionCommand(super.logger, super.audioPlayerService);

  @override
  String get description =>
      '''Display available information about the current version of dart_vader_cli package''';

  @override
  String get name => 'version';

  @override
  String get assetName => 'dart_vader_imperial_theme.mp3';

  String get _packageName => 'Dart Vader Cli';

  @override
  FutureOr<int> run() async {
    try {
      final figletText = red.wrap(await FigletLog.getText(_packageName));

      logger
        ..info(figletText)
        ..info('Dart vader cli version: $packageVersion');

      await playCommand();

      return ExitCode.success.code;
    } on PathNotFoundException catch (e) {
      logger.alert('Error rendering figlet: $e');
      return ExitCode.osFile.code;
    } on Exception catch (e) {
      logger.alert('Error rendering figlet: $e');
      return ExitCode.software.code;
    }
  }
}
