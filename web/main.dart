import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react_window/over_react_window.dart';
import 'package:react/react_client/js_backed_map.dart';

void main() {
  setClientConfiguration();

  final list = AutoSizer()(
    functionComponentProxy((props) => (FixedSizeList()
      ..addProps(props)
      ..innerElementType = 'ul'
      ..itemCount = 1000
      ..itemSize = 50
      ..height = props['height']
      ..width = props['width']
    )(
      functionComponentProxy((props) => (Dom.li()
        ..addProps(props)
        ..style = Map.from(JsBackedMap.backedBy(props['style']))
        ..className = 'list-group-item'
      )('Row ${props['index']}')),
    )),
  );

  dynamic defaultCellDataGetter(JsMap jsProps) {
    final _props = new JsBackedMap.backedBy(jsProps);
    return _props['rowData'][_props['dataKey']];
  }

  // Table data as an array of objects
  final List<Map<String, dynamic>> tableData = List.generate(1000, (index) {
    return {
      'name': 'Name of row $index',
      'age': 'Age of row $index',
      'image': 'Image of row $index',
      'description': 'Description of row $index',
    };
  });

  final table = AutoSizer()(
    functionComponentProxy((props) => (Table()
      ..width = props['width']
      ..height = props['height']
      ..headerHeight = 20
      ..rowHeight = ((_) => 30)
      ..rowCount = tableData.length
      ..rowGetter = ((props) {
        final _props = new JsBackedMap.backedBy(props);
        return tableData[_props['index']];
      })
    )(
      (Column()
        ..label = 'Name'
        ..dataKey = 'name'
        ..width = 100
        ..cellDataGetter = defaultCellDataGetter
      )(),
      (Column()
        ..label = 'Age'
        ..dataKey = 'age'
        ..width = 100
        ..cellDataGetter = defaultCellDataGetter
      )(),
      (Column()
        ..label = 'Image'
        ..dataKey = 'image'
        ..width = 100
        ..cellDataGetter = defaultCellDataGetter
      )(),
      (Column()
        ..label = 'Description'
        ..dataKey = 'description'
        ..width = 200
        ..cellDataGetter = defaultCellDataGetter
      )(),
    ))
  );

  react_dom.render(table, querySelector('#app'));
}
