part of over_react_window.wrapped_components;

final _FixedSizeGrid = new ReactJsComponentFactoryProxy(interop.ReactWindow.FixedSizeGrid);

/// Renders a "windowed" list of items that all have a dimension of
/// [FixedSizeGridDefinition.itemSize] along the scrolling axis.
///
/// > See: [FixedSizeGridDefinition] for a full list of component prop options.
///
/// ### Defining item children
///
/// Use [functionComponentProxy] as the single child, which will proxy an `columnIndex`, `rowIndex` and `style`
/// prop to the component returned inside the proxy body as shown in the example below.
///
///     @override
///     render() {
///       return (FixedSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = 75
///         ..rowCount = 1000
///         ..rowHeight = 25
///         ..height = 150
///         ..width = 300
///       )(
///         functionComponentProxy((props) => (Dom.div()
///           ..addProps(props)
///           ..style = Map.from(JsBackedMap.backedBy(props['style']))
///         )('Item ${props['rowIndex']},${props['columnIndex']}')),
///       );
///     }
///
/// If [FixedSizeGridDefinition.useIsScrolling] is enabled for the grid,
/// an `isScrolling` boolean prop will also be proxied:
///
///     @override
///     render() {
///       return (FixedSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = 75
///         ..rowCount = 1000
///         ..rowHeight = 25
///         ..height = 150
///         ..width = 300
///         ..useIsScrolling = true
///       )(
///         functionComponentProxy((props) => (Dom.div()
///           ..addProps(props)
///           ..style = Map.from(JsBackedMap.backedBy(props['style']))
///         )('Item ${props['rowIndex']},${props['columnIndex']} (scrolling: ${props['isScrolling']})')),
///       );
///     }
///
/// If [FixedSizeGridDefinition.itemData] is enabled for the grid,
/// a `data` prop will also be proxied:
///
///     const List<Map<String, String>> itemData = [
///       [
///         {'name': 'Row 1, Column 1'},
///         {'name': 'Row 1, Column 2'},
///         {'name': 'Row 1, Column 3'},
///       ],
///       [
///         {'name': 'Row 2, Column 1'},
///         {'name': 'Row 2, Column 2'},
///         {'name': 'Row 2, Column 3'},
///       ],
///       [
///         {'name': 'Row 3, Column 1'},
///         {'name': 'Row 3, Column 2'},
///         {'name': 'Row 3, Column 3'},
///       ],
///     ];
///
///     @override
///     render() {
///       return (FixedSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = 75
///         ..rowCount = 1000
///         ..rowHeight = 25
///         ..height = 150
///         ..width = 300
///         ..itemData = itemData
///       )(
///         functionComponentProxy((props) {
///           final itemData = props['data'][props['rowIndex']][props['columnIndex']];
///           return (Dom.div()
///             ..addProps(props)
///             ..style = Map.from(JsBackedMap.backedBy(props['style']))
///           )(itemData['name']);
///         }),
///       );
///     }
///
/// ### Calling instance methods
///
/// The [FixedSizeGrid] component exposes two methods:
/// [FixedSizeGridComponent.scrollTo] and [FixedSizeGridComponent.scrollToItem].
///
/// You can call them by utilizing a callback `ref` like so:
///
///     FixedSizeGridComponent componentRef;
///
///     @override
///     render() {
///       return (FixedSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = 75
///         ..rowCount = 1000
///         ..rowHeight = 25
///         ..height = 150
///         ..width = 300
///         ..ref = (ref) {
///           componentRef = ref as FixedSizeGridComponent;
///         }
///       )(
///         functionComponentProxy((props) => (Dom.div()
///           ..addProps(props)
///           ..style = Map.from(JsBackedMap.backedBy(props['style']))
///         )('Row ${props['index']}')),
///       );
///     }
///
///     void someMethodOrFunction() {
///       componentRef.scrollTo(someScrollLeftOffsetValue, someScrollTopOffsetValue);
///     }
///
///     void someOtherMethodOrFunction() {
///       componentRef.scrollToItem(someScrollOffsetValue);
///     }
///
/// > Related: [VariableSizeGrid]
FixedSizeGridDefinition FixedSizeGrid() => FixedSizeGridDefinition({});
class FixedSizeGridDefinition extends _AbstractGridDefinition {
  FixedSizeGridDefinition(Map props) : super(_FixedSizeGrid, props);

  /// Height of an individual row within a [FixedSizeGrid].
  ///
  /// > Related: [columnWidth]
  int get rowHeight => props['rowHeight'];
  set rowHeight(int value) => props['rowHeight'] = value;

  /// Width of an individual column within a [FixedSizeGrid].
  ///
  /// > Related: [rowHeight]
  int get columnWidth => props['columnWidth'];
  set columnWidth(int value) => props['columnWidth'] = value;
}

@JS('ReactWindow.FixedSizeGrid')
class FixedSizeGridComponent {
  /// Scroll to the specified [scrollLeft] and/or [scrollTop] offset.
  external void scrollTo(int scrollLeft, int scrollTop);

  /// Scroll to the specified item at [index].
  ///
  /// By default, the [FixedSizeGrid] will scroll as little as possible to ensure the item is visible.
  /// You can control the alignment of the item though by specifying a second [align] parameter.
  ///
  /// Acceptable values are:
  ///
  ///   * "auto" (default) - Scroll as little as possible to ensure the item is visible.
  ///     _(If the item is already visible, it won't scroll at all.)_
  ///   * "smart" - If the item is already visible, don't scroll at all.
  ///     * If it is less than one viewport away, scroll as little as possible so that it becomes visible.
  ///     * If it is more than one viewport away, scroll so that it is centered within the list.
  ///   * "center" - Center align the item within the list.
  ///   * "end" - Align the item to the end of the list
  ///     _(the bottom for vertical lists or the right for horizontal lists)_.
  ///   * "start" - Align the item to the beginning of the list
  ///     _(the top for vertical lists or the left for horizontal lists)_.
  ///
  /// If either [columnIndex] or [rowIndex] are omitted, the `scrollLeft` or `scrollTop`
  /// will be unchanged (respectively).
  external void scrollToItem([String align = 'auto', int columnIndex, int rowIndex]);
}
