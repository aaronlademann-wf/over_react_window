@JS()
library over_react_window.js_interop;

import 'package:js/js.dart';
import 'package:react/react_client/react_interop.dart';

@JS()
class ReactWindow {
  external static ReactClass get FixedSizeList;
  external static ReactClass get VariableSizeList;
  external static ReactClass get FixedSizeGrid;
  external static ReactClass get VariableSizeGrid;
}

@JS('ReactWindow.AutoSizer')
external ReactClass get AutoSizer;

@JS()
class ReactVirtualized {
  external static ReactClass get Table;
  external static ReactClass get Column;
  external static ReactClass get SortDirection;
  external static dynamic Function(dynamic ref) get defaultHeaderRenderer;
  external static dynamic Function(dynamic ref) get defaultCellRenderer;
  external static dynamic Function(dynamic ref) get defaultCellDataGetter;
}

//@JS('Table')
//external ReactClass get Table;
//
//@JS('Column')
//external ReactClass get Column;
//
//@JS('SortDirection')
//external ReactClass get SortDirection;
//
//@JS('defaultHeaderRenderer')
//external dynamic Function(dynamic ref) get defaultHeaderRenderer;
//
//@JS('defaultCellRenderer')
//external dynamic Function(dynamic ref) get defaultCellRenderer;
//
//@JS('defaultCellDataGetter')
//external dynamic Function(dynamic ref) get defaultCellDataGetter;
