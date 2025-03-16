import 'package:cli_completion/cli_completion.dart';
import 'package:dart_vader_cli/src/commands/version.dart';
import 'package:mason_logger/mason_logger.dart' show Logger;

/// {@template dart_vader_cli_command_runner}
/// [DartVaderCliCommandRunner] is a [CompletionCommandRunner] class
/// of the Dart Vader cli.
/// {@endtemplate}
class DartVaderCliCommandRunner extends CompletionCommandRunner<int> {
  /// {@macro dart_vader_cli_command_runner}
  DartVaderCliCommandRunner()
    : _logger = Logger(),
      super(_executableName, _description) {
    addCommand(VersionCommand(_logger));
  }

  final Logger _logger;

  static String get _executableName => 'dart-vader';

  static String get _description =>
      '''Darth Vader \u{2015} may the code break with you!''';
}
