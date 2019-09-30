import 'dart:html';
import 'dart:js';

import 'package:over_react/over_react.dart';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react_window/over_react_window.dart';
import 'package:react/react_client/js_backed_map.dart';
import 'package:w_virtual_components/w_virtual_components.dart';

void main() {
  setClientConfiguration();

  dynamic itemRenderer(Map itemProps) {
    var index = itemProps['index'];

    return (Dom.li()..className = 'list-group-item')('Row $index');
  }

  react_dom.render((Dom.ul()..className = 'list-group')(
    (VirtualList()
      ..itemSizes = new ItemSizeCollection.fixed(1000, new Size(null, 50))
      ..itemPropsFactory = ((int index) => {'index': index})
      ..itemRenderer = itemRenderer
      ..rerenderItemsWhenRerendered = true
      ..itemPropsFactory = ((int index) => {'index': index})
      ..layoutFactory2 = verticalLayout
  )()), querySelector('#app'));

//  react_dom.render(AutoSizer({}, allowInterop((props) {
//    final dartProps = new JsBackedMap.backedBy(props);
//    final height = dartProps['height'];
//    final width = dartProps['width'];
//    return FixedSizeList({
//      'innerElementType': 'ul',
//      'innerClassName': 'list-group',
//      'height': height,
//      'itemCount': 1000,
//      'itemSize': 50,
//      'width': width
//    },
//      ListGroupItemRow
//    );
//  })), querySelector('#app'));
}
