@TestOn('browser')
library test.unit.generated_runner_test;

// Generated by `pub run dart_dev gen-test-runner -d test/unit -e Environment.browser --genHtml`

import './over_react_window_test.dart' as over_react_window_test;
import 'package:test/test.dart';
// ignore_for_file: directives_ordering
import 'package:over_react/over_react.dart';
import 'package:over_react_window/over_react_window.dart';

void main() {
  setClientConfiguration();
  enableTestMode();
  over_react_window_test.main();
}