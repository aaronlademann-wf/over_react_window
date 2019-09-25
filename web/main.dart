import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react_window/over_react_window.dart';

void main() {
  setClientConfiguration();

  react_dom.render(SampleApp()(), querySelector('#app'));
}
