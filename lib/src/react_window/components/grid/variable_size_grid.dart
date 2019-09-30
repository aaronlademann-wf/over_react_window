part of over_react_window.wrapped_components;

final _VariableSizeGrid = new ReactJsComponentFactoryProxy(interop.ReactWindow.VariableSizeGrid);

/// Renders a "windowed" list of items that have varying dimensions
/// _(defined using the [VariableSizeGridDefinition.itemSize] function)_ along the scrolling axis.
///
/// > See: [VariableSizeGridDefinition] for a full list of component prop options.
///
/// ### Defining item children
///
/// Use [functionComponentProxy] as the single child, which will proxy an `columnIndex`, `rowIndex` and `style`
/// prop to the component returned inside the proxy body as shown in the example below.
///
///     // These item sizes are arbitrary.
///     // Yours should be based on the content of the item.
///     final columnWidths = List<int>.generate(1000, (index) => 75 + Random().nextInt(50));
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = ((index) => columnWidths[i])
///         ..rowCount = 1000
///         ..rowHeight = ((index) => rowHeights[i])
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
/// If [VariableSizeGridDefinition.useIsScrolling] is enabled for the grid,
/// an `isScrolling` boolean prop will also be proxied:
///
///     // These item sizes are arbitrary.
///     // Yours should be based on the content of the item.
///     final columnWidths = List<int>.generate(1000, (index) => 75 + Random().nextInt(50));
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = ((index) => columnWidths[i])
///         ..rowCount = 1000
///         ..rowHeight = ((index) => rowHeights[i])
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
/// If [VariableSizeGridDefinition.itemData] is enabled for the grid,
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
///     // These item sizes are arbitrary.
///     // Yours should be based on the content of the item.
///     final columnWidths = List<int>.generate(1000, (index) => 75 + Random().nextInt(50));
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = ((index) => columnWidths[i])
///         ..rowCount = 1000
///         ..rowHeight = ((index) => rowHeights[i])
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
/// The [VariableSizeGrid] component exposes five methods:
/// [VariableSizeGridComponent.scrollTo], [VariableSizeGridComponent.scrollToItem],
/// [VariableSizeGridComponent.resetAfterColumnIndex], [VariableSizeGridComponent.resetAfterRowIndex]
/// and [VariableSizeGridComponent.resetAfterIndices].
///
/// You can call them by utilizing a callback `ref` like so:
///
///     VariableSizeGridComponent componentRef;
///
///     // These item sizes are arbitrary.
///     // Yours should be based on the content of the item.
///     final columnWidths = List<int>.generate(1000, (index) => 75 + Random().nextInt(50));
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeGrid()
///         ..columnCount = 1000
///         ..columnWidth = ((index) => columnWidths[i])
///         ..rowCount = 1000
///         ..rowHeight = ((index) => rowHeights[i])
///         ..height = 150
///         ..width = 300
///         ..ref = (ref) {
///           componentRef = ref as VariableSizeGridComponent;
///         }
///       )(
///         functionComponentProxy((props) => (Dom.div()
///           ..addProps(props)
///           ..style = Map.from(JsBackedMap.backedBy(props['style']))
///         )('Row ${props['index']}')),
///       );
///     }
///
///     void handleRowHeightChange(List<int> indexOfRowThatChangedHeight) {
///       componentRef.resetAfterRowIndex(indexOfRowThatChangedHeight);
///     }
///
///     void handleColumnWidthChange(List<int> indexOfColumnThatChangedWidth) {
///       componentRef.resetAfterRowIndex(indexOfRowThatChangedHeight);
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
/// > Related: [FixedSizeGrid]
VariableSizeGridDefinition VariableSizeGrid() => VariableSizeGridDefinition({});
class VariableSizeGridDefinition extends _AbstractGridDefinition {
  VariableSizeGridDefinition(Map props) : super(_VariableSizeGrid, props);

  /// Average (or estimated) row height for unrendered rows.
  ///
  /// This value is used to calculated the estimated total height of a [VariableSizeGrid]
  /// before its rows have all been measured.
  ///
  /// The estimated height impacts user scrolling behavior. It is updated whenever new rows are measured.
  ///
  /// > Related: [estimatedColumnWidth]
  int get estimatedRowHeight => props['estimatedRowHeight'];
  set estimatedRowHeight(int value) => props['estimatedRowHeight'] = value;

  /// Returns the height of the specified row.
  ///
  /// > Related: [columnWidth]
  int Function(int index) get rowHeight => props['rowHeight'];
  set rowHeight(int Function(int index) value) => props['rowHeight'] = value;

  /// Average (or estimated) column width for unrendered columns.
  ///
  /// This value is used to calculated the estimated total width of a [VariableSizeGrid]
  /// before its columns have all been measured.
  ///
  /// The estimated width impacts user scrolling behavior. It is updated whenever new columns are measured.
  ///
  /// > Related: [estimatedRowHeight]
  int get estimatedColumnWidth => props['estimatedColumnWidth'];
  set estimatedColumnWidth(int value) => props['estimatedColumnWidth'] = value;

  /// Returns the width of the specified column.
  ///
  /// > Related: [rowHeight]
  int Function(int index) get columnWidth => props['columnWidth'];
  set columnWidth(int Function(int index) value) => props['columnWidth'] = value;
}

@JS('ReactWindow.VariableSizeGrid')
class VariableSizeGridComponent {
  /// Scroll to the specified [offset] (`scrollTop` or `scrollLeft`, depending on the value of the direction prop).
  external void scrollTo(int offset);

  /// Scroll to the specified item at [index].
  ///
  /// By default, the [VariableSizeList] will scroll as little as possible to ensure the item is visible.
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
  external void scrollToItem(int index, {String align = 'auto'});

  /// Clears that cached data for all items after (and including) the specified [index].
  ///
  /// [VariableSizeList] caches offsets and measurements for each index for performance purposes.
  ///
  /// This method should be called whenever an item's size changes. _(Note that this is not a typical occurrence.)_
  ///
  /// By default the list will automatically re-render after the index is reset.
  /// If you would like to delay this re-render _(e.g. until a state update has completed in the parent component)_,
  /// specify a value of `false` for [shouldForceUpdate].
  external void resetAfterIndex(int index, {bool shouldForceUpdate = true});
}
