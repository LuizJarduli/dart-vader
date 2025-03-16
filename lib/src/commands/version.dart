import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dart_vader_cli/src/version.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template dart_vader_cli_version}
/// Dart vader cli display version [Command].
/// {@endtemplate}
class VersionCommand extends Command<int> {
  /// {@macro dart_vader_cli_version}
  VersionCommand(this._logger);

  final Logger _logger;

  @override
  String get description =>
      '''Display available information about the current version of dart_vader_cli package''';

  @override
  String get name => 'version';

  @override
  FutureOr<int>? run() {
    _logger.info('Dart vader cli version: $packageVersion');
    return ExitCode.success.code;
  }
}
