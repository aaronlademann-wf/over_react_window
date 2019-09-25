// https://github.com/Workiva/dart_dev#project-configuration
import 'package:dart_dev/dart_dev.dart' show Environment, TestRunnerConfig, config, dev;

main(List<String> args) async {
  const directories = const <String>[
    'lib/',
    'tool/',
    'web/',
  ];

  config.analyze.entryPoints = directories;

  config.format
    ..lineLength = 120
    ..paths = directories
    ..exclude = [
      'tool/over_react_format/',
    ];

  config.test
    ..concurrency = 1
    ..platforms = [
      'chrome',
    ]
    ..unitTests = [
      'test/unit/generated_runner_test.dart',
    ];

  config.genTestRunner.configs = <TestRunnerConfig>[
    new TestRunnerConfig(
      genHtml: true,
      directory: 'test/unit',
      env: Environment.browser,
      filename: 'generated_runner_test',
      dartHeaders: const <String>[
        '// ignore_for_file: directives_ordering',
        'import \'package:over_react/over_react.dart\';',
        'import \'package:over_react_window/over_react_window.dart\';',
      ],
      preTestCommands: const <String>[
        'setClientConfiguration();',
        'enableTestMode();',
      ],
      htmlHeaders: const <String>[
        '<script src="packages/react/react_with_addons.js"></script>',
        '<script src="packages/react/react_dom.js"></script>',
        '<script src="/packages/over_react_window/index-dev.umd.js"></script>',
      ],
    ),
  ];

  await dev(args);
}
