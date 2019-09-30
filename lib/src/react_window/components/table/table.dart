part of over_react_window.wrapped_components;

final JsTable = new ReactJsComponentFactoryProxy(interop.ReactVirtualized.Table);

/// TODO
///
/// Accepts a list of [Column]s as children.
///
/// Use [TableComponent] as the type for any callback refs to gain access to instance methods.
TableDefinition Table() => TableDefinition({});
class TableDefinition extends InteropComponentDefinition {
  TableDefinition(Map props) : super(JsTable, props);

  /// Outer height of Table is set to "auto".
  ///
  /// This property should only be used in conjunction with the `WindowScroller` HOC.
  bool get autoHeight => props['autoHeight'];
  set autoHeight(bool value) => props['autoHeight'] = value;

  /// Do not render the table header (only the rows).
  bool get disableHeader => props['disableHeader'];
  set disableHeader(bool value) => props['disableHeader'] = value;

  /// Used to estimate the total height of a [Table] before all of its rows have actually been measured.
  ///
  /// The estimated total height is adjusted as rows are rendered.
  int get estimatedRowSize => props['estimatedRowSize'];
  set estimatedRowSize(int value) => props['estimatedRowSize'] = value;

  /// Optional custom CSS class name to attach to inner `Grid` element
  String get gridClassName => props['gridClassName'];
  set gridClassName(String value) => props['gridClassName'] = value;

  /// Optional inline style to attach to inner `Grid` element.
  Map get gridStyle => props['gridStyle'];
  set gridStyle(Map value) => props['gridStyle'] = value;

  /// Optional override of inner `Grid` tab index default.
  ///
  /// Default value: 0
  int get gridTabIndex => props['tabIndex'];
  set gridTabIndex(int value) => props['tabIndex'] = value;

  /// CSS class to apply to all column headers.
  String get headerClassName => props['headerClassName'];
  set headerClassName(String value) => props['headerClassName'] = value;

  /// Fixed height of header row.
  ///
  /// __Required__
  int get headerHeight => props['headerHeight'];
  set headerHeight(int value) => props['headerHeight'] = value;

  /// Responsible for rendering the table header row given an list of `columns`.
  ReactElement Function({
    String className,
    List<ReactElement> columns,
    Map style,
  }) get headerRowRenderer => props['headerRowRenderer'];
  set headerRowRenderer(ReactElement Function({
    String className,
    List<ReactElement> columns,
    Map style,
  }) callback) => props['headerRowRenderer'] = callback;

  /// Optional custom inline style to attach to table header columns.
  Map get headerStyle => props['headerStyle'];
  set headerStyle(Map value) => props['headerStyle'] = value;

  /// Fixed/available height for out DOM element.
  ///
  /// __Required__
  @override
  int get height => props['height'];
  @override
  set height(covariant int value) => props['height'] = value;

  /// Width of the table
  ///
  /// __Required__
  @override
  int get width => props['width'];
  @override
  set width(covariant int value) => props['width'] = value;

  /// Callback used to render placeholder content when [rowCount] is `0`.
  ///
  /// TODO: Is this a ReactElement or dynamic?
  dynamic Function() get noRowsRenderer => props['noRowsRenderer'];
  set noRowsRenderer(Function() callback) => props['noRowsRenderer'] = callback;

  /// Callback invoked when a user clicks on a table column.
  void Function(Map<String, dynamic> columnData, String dataKey, Event event) get onColumnClick => props['onColumnClick'];
  set onColumnClick(void Function(Map<String, dynamic> columnData, String dataKey, Event event) callback) => props['onColumnClick'] = callback;

  /// Callback invoked when a user clicks on a table header.
  void Function(Map<String, dynamic> columnData, String dataKey, Event event) get onHeaderClick => props['onHeaderClick'];
  set onHeaderClick(void Function(Map<String, dynamic> columnData, String dataKey, Event event) callback) => props['onHeaderClick'] = callback;

  /// Callback invoked when a user clicks on a table row.
  void Function(Event event, int index, Map<String, dynamic> rowData) get onRowClick => props['onRowClick'];
  set onRowClick(void Function(Event event, int index, Map<String, dynamic> rowData) callback) => props['onRowClick'] = callback;

  /// Callback invoked when a user double-clicks on a table row.
  void Function(Event event, int index, Map<String, dynamic> rowData) get onRowDoubleClick => props['onRowDoubleClick'];
  set onRowDoubleClick(void Function(Event event, int index, Map<String, dynamic> rowData) callback) => props['onRowDoubleClick'] = callback;

  /// Callback invoked when the mouse leaves a table row.
  void Function(Event event, int index, Map<String, dynamic> rowData) get onRowMouseOut => props['onRowMouseOut'];
  set onRowMouseOut(void Function(Event event, int index, Map<String, dynamic> rowData) callback) => props['onRowMouseOut'] = callback;

  /// Callback invoked when a user moves the mouse over a table row.
  void Function(Event event, int index, Map<String, dynamic> rowData) get onRowMouseOver => props['onRowMouseOver'];
  set onRowMouseOver(void Function(Event event, int index, Map<String, dynamic> rowData) callback) => props['onRowMouseOver'] = callback;

  /// Callback invoked when a user right-clicks on a table row.
  void Function(Event event, int index, Map<String, dynamic> rowData) get onRowRightClick => props['onRowRightClick'];
  set onRowRightClick(void Function(Event event, int index, Map<String, dynamic> rowData) callback) => props['onRowRightClick'] = callback;

  /// Callback invoked with information about the slice of rows that were just rendered.
  void Function(
    int overscanStartIndex,
    int overscanStopIndex,
    int startIndex,
    int stopIndex,
  ) get onRowsRendered => props['onRowsRendered'];
  set onRowsRendered(void Function(
    int overscanStartIndex,
    int overscanStopIndex,
    int startIndex,
    int stopIndex,
  ) callback) => props['onRowsRendered'] = callback;

  /// Number of rows to render above/below the visible bounds of the list.
  ///
  /// This can help reduce flickering during scrolling on certain browsers/devices.
  int get overscanRowCount => props['overscanRowCount'];
  set overscanRowCount(int value) => props['overscanRowCount'] = value;

  /// Callback invoked whenever the scroll offset changes within the inner scrollable region
  void Function(int clientHeight, int scrollHeight, int scrollTop) get onWindowScroll => props['onScroll'];
  set onWindowScroll(void Function(int clientHeight, int scrollHeight, int scrollTop) callback) => props['onScroll'] = callback;

  /// CSS class to apply to all table rows (including the header row).
  ///
  /// Note that for the header row an `index` of -1 is provided.
  String Function(int index) get rowClassName => props['rowClassName'];
  set rowClassName(String Function(int index) callback) => props['rowClassName'] = callback;

  /// The number of rows in a [Table].
  ///
  /// __Required__
  int get rowCount => props['rowCount'];
  set rowCount(int value) => props['rowCount'] = value;

  /// Callback responsible for returning a data row given the `index` value within the provided [props].
  ///
  /// __Required__
  Map<String, dynamic> Function(JsMap props) get rowGetter => props['rowGetter'];
  set rowGetter(Map<String, dynamic> Function(JsMap props) callback) => props['rowGetter'] = callback;

  /// Returns the height of a row given its `index`.
  int Function(int index) get rowHeight => props['rowHeight'];
  set rowHeight(int Function(int index) callback) => props['rowHeight'] = callback;

  /// Responsible for rendering a table row given an array of columns.
  ///
  /// TODO: Is this dynamic, or ReactElement?
  /// TODO: Is there a way to type this to ensure that `functionComponentProxy` is used?
  dynamic Function() get rowRenderer => props['rowRenderer'];
  set rowRenderer(dynamic Function() callback) => props['rowRenderer'] = callback;

  /// Optional custom inline style to attach to table rows.
  ///
  /// Note that for the header row an index of -1 is provided.
  Map Function(int index) get rowStyle => props['rowStyle'];
  set rowStyle(Map Function(int index) callback) => props['rowStyle'] = callback;

  /// Controls the alignment scrolled-to-rows.
  ///
  /// * The default ("auto") scrolls the least amount possible to ensure that the specified row is fully visible.
  /// * Use "start" to always align rows to the top of the list and "end" to align them bottom.
  /// * Use "center" to align them in the middle of container.
  String get scrollToAlignment => props['scrollToAlignment'];
  set scrollToAlignment(String value) => props['scrollToAlignment'] = value;

  /// Row index to ensure visible (by forcefully scrolling if necessary).
  int get scrollToIndex => props['scrollToIndex'];
  set scrollToIndex(int value) => props['scrollToIndex'] = value;

  /// Vertical offset
  int get scrollTop => props['scrollTop'];
  set scrollTop(int value) => props['scrollTop'] = value;

  /// Sort function to be called if a sortable header is clicked.
  void Function(
    String defaultSortDirection,
    MouseEvent event,
    String sortBy,
    dynamic/*SortDirection*/ sortDirection,
  ) get sort => props['sort'];
  set sort(void Function(
    String defaultSortDirection,
    MouseEvent event,
    String sortBy,
    dynamic/*SortDirection*/ sortDirection,
  ) callback) => props['sort'] = callback;

  /// Data is currently sorted by this dataKey (if it is sorted at all)
  String get sortBy => props['sortBy'];
  set sortBy(String value) => props['sortBy'] = value;

  /// Data is currently sorted in this direction (if it is sorted at all)
  dynamic/*SortDirection*/ get sortDirection => props['sortDirection'];
  set sortDirection(dynamic/*SortDirection*/ value) => props['sortDirection'] = value;
}

@JS('ReactVirtualized.Table')
class TableComponent {
  /// Forcefully re-render the inner `Grid` component.
  ///
  /// This may be appropriate if the underlying row data has changed but the row sizes themselves have not.
  external void forceUpdateGrid();

  /// Gets offset for a given row [index] and [alignment].
  external int getOffsetForRow(String alignment, int index);

  /// Gets the scrollbar width used to pad the table-header.
  external int getScrollbarWidth();

  /// Pre-measure all rows in a [Table].
  ///
  /// Typically rows are only measured as needed and estimated heights are used for cells that have not yet been measured.
  ///
  /// This method ensures that the next call to `getTotalSize()` returns an exact size _(as opposed to just an estimated one)_.
  external void measureAllRows();

  /// Recompute row heights and offsets after the specified [index].
  ///
  /// [Table] has no way of knowing when its underlying list data has changed since it only receives a `rowHeight` property.
  /// If the `rowHeight` is a number it can compare before and after values but if it is a function
  /// that comparison is error prone. In the event that a dynamic rowHeight function is in use and the
  /// row heights have changed this function should be manually called by the "smart" container parent.
  ///
  /// This method will also force a render cycle (via `forceUpdate`) to ensure that the updated measurements are
  /// reflected in the rendered table.
  external void recomputeRowHeights([int index = 0]);

  /// Scroll to the specified [offset].
  ///
  /// Useful for animating position changes.
  external void scrollToPosition(int offset);

  /// Ensure row at [index] is visible.
  ///
  /// This method can be used to safely scroll back to a cell that a user has scrolled away from
  /// even if it was previously scrolled to.
  external void scrollToRow(int index);
}

