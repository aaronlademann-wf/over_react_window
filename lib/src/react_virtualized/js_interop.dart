@JS()
library over_react_virtualized.js_interop;

import 'package:js/js.dart';
import 'package:react/react_client/react_interop.dart';

@JS()
class ReactVirtualized {
  // Base components

  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/Collection.md
  external static ReactClass get Collection;
  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/Grid.md
  external static ReactClass get Grid;
  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/List.md
  external static ReactClass get List;
  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/Masonry.md
  external static ReactClass get Masonry;
  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/Table.md
  external static ReactClass get Table;
  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/Column.md
  external static ReactClass get Column;
  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/SortDirection.md
  external static ReactClass get SortDirection;

  // HOCs

  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/ArrowKeyStepper.md
  external static ReactClass get ArrowKeyStepper;
  /// https://github.com/bvaughn/react-virtualized/blob/master/docs/AutoSizer.md
  external static ReactClass get AutoSizer;
}


