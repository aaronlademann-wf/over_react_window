import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react_window/over_react_virtualized.dart';
import 'package:react/react_client/js_backed_map.dart';

void main() {
  setClientConfiguration();

  react_dom.render(AutoSizer()(
    functionComponentProxy((props) => (List()
      ..['rowCount'] = 1000
      ..['rowHeight'] = 50
      ..['height'] = props['height']
      ..['width'] = props['width']
      ..['rowRenderer'] = functionComponentProxy((props) {
        return (Dom.div()
          ..key = props['key']
          ..style = Map.from(JsBackedMap.backedBy(props['style']))
          ..className = 'list-group-item'
        )('Row ${props['index']}');
      })
    )()),
  ), querySelector('#app'));
}
