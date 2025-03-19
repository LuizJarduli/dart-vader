import 'dart:io';

import 'package:dart_vader_cli/src/dart_vader_cli_command_runner.dart';

void main(List<String> arguments) async {
  await flushThenExit(await DartVaderCliCommandRunner().run(arguments));
}

/// Credits to felangel [mason_cli](https://github.com/felangel/mason/blob/master/packages/mason_cli/bin/mason.dart)
Future<dynamic> flushThenExit(int? status) {
  return Future.wait<void>([
    stdout.close(),
    stderr.close(),
  ]).then<void>((_) => exit(status ?? 1));
}
