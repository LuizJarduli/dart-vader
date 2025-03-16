import 'package:args/args.dart';
import 'package:cli_completion/cli_completion.dart';

extension on ArgParser {
  void addCommonFlags() {
    addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Get the current package version.',
    );
  }
}

/// {@template dart_vader_cli_command_runner}
/// [DartVaderCliCommandRunner] is a [CompletionCommandRunner] class
/// of the Dart Vader cli.
/// {@endtemplate}
class DartVaderCliCommandRunner extends CompletionCommandRunner<int> {
  /// {@macro dart_vader_cli_command_runner}
  DartVaderCliCommandRunner() : super(_executableName, _description) {
    argParser.addCommonFlags();
  }

  static String get _executableName => 'dart-vader';

  static String get _description =>
      '''Darth Vader \u{2015} may the code break with you!''';
}
