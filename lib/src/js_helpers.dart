library over_react_window.js_helpers;

import 'package:js/js.dart';
import 'package:over_react/over_react.dart';
import 'package:over_react/component_base.dart' as component_base;
import 'package:react/react_client/js_backed_map.dart';

dynamic Function(JsMap props) functionComponentProxy(dynamic Function(Map props) dartFunctionComponent) {
  jsFunctionComponent(JsMap jsProps) => dartFunctionComponent(JsBackedMap.backedBy(jsProps));
  return allowInterop(jsFunctionComponent);
}

class InteropComponentDefinition extends component_base.UiProps
    with
        DomPropsMixin,
        GeneratedClass
    implements
        UiProps {
  // Wrap Map literal in parens to work around https://github.com/dart-lang/sdk/issues/24410
  InteropComponentDefinition(this.componentFactory, [Map props]) : this.props = props ?? ({});

  @override
  ReactComponentFactoryProxy componentFactory;

  @override
  final Map props;

  @override
  String get propKeyNamespace => '';
}
