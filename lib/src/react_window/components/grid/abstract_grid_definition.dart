part of over_react_window.wrapped_components;

/// An abstract definition of typed props shared by [FixedSizeGrid] and [VariableSizeGrid].
abstract class _AbstractGridDefinition extends _AbstractWindowComponentDefinition<int> {
  _AbstractGridDefinition(ReactJsComponentFactoryProxy factoryProxy, Map props) : super(factoryProxy, props);

  /// Number of columns in the grid.
  ///
  /// Note that the number of columns that are rendered and displayed at one time is
  /// determined based on [columnWidth] and [width].
  int get columnCount => props['columnCount'];
  set columnCount(int value) => props['columnCount'] = value;

  /// Number of rows in the grid.
  ///
  /// Note that the number of rows that are rendered and displayed at one time is
  /// determined based on [rowHeight] and [height].
  int get rowCount => props['rowCount'];
  set rowCount(int value) => props['rowCount'] = value;

  /// Horizontal scroll offset for initial render.
  ///
  /// > Related: [initialScrollTop]
  int get initialScrollLeft => props['initialScrollLeft'];
  set initialScrollLeft(int value) => props['initialScrollLeft'] = value;

  /// Vertical scroll offset for initial render.
  ///
  /// > Related: [initialScrollLeft]
  int get initialScrollTop => props['initialScrollTop'];
  set initialScrollTop(int value) => props['initialScrollTop'] = value;

  /// The number of columns to render outside of the visible window area.
  ///
  /// This property can be important for two reasons:
  ///
  /// * Overscanning by one column allows the tab key to focus on the next (not yet visible) item.
  /// * Overscanning slightly can reduce or prevent a flash of empty space when a user first starts scrolling.
  ///
  /// Note that overscanning too much can negatively impact performance.
  ///
  /// Default value: 1
  ///
  /// > Related [overscanRowCount]
  int get overscanColumnCount => props['overscanColumnCount'];
  set overscanColumnCount(int value) => props['overscanColumnCount'] = value;

  /// The number of rows to render outside of the visible window area.
  ///
  /// This property can be important for two reasons:
  ///
  /// * Overscanning by one row allows the tab key to focus on the next (not yet visible) item.
  /// * Overscanning slightly can reduce or prevent a flash of empty space when a user first starts scrolling.
  ///
  /// Note that overscanning too much can negatively impact performance.
  ///
  /// Default value: 1
  ///
  /// > Related [overscanColumnCount]
  int get overscanRowCount => props['overscanRowCount'];
  set overscanRowCount(int value) => props['overscanRowCount'] = value;

  /// By default, grids will use an item's indices as its key.
  ///
  /// This is okay if:
  ///
  /// * Your collections of items is never sorted or modified
  /// * Your item renderer is not stateful and does not extend PureComponent
  ///
  /// If your grid does not satisfy the above constraints, use the `itemKey` prop to specify your own keys for items:
  ///
  ///     @override
  ///     render() {
  ///       return (FixedSizeGrid()
  ///         // The other required props would need to be here as well
  ///         ..itemKey = (columnIndex, data, rowIndex) {
  ///           // Find the item for the specified indices.
  ///           // In this case "data" is a List that was passed to FixedSizeGrid as `props.itemData`.
  ///           const item = data[rowIndex][columnIndex];
  ///
  ///           // Return a value that uniquely identifies this item.
  ///           // For a grid, this key must represent both the row and column.
  ///           // Typically this will be something dynamic like a UID for the row,
  ///           // Mixed with something more static like the incoming column index.
  ///           return `${item['id']}-${columnIndex}`;
  ///         }
  ///       )(
  ///         // ... child renderer ...
  ///       );
  ///     }
  dynamic Function(int index, dynamic data) get itemKey => props['itemKey'];
  set itemKey(dynamic Function(int index, dynamic data) callback) => props['itemKey'] = callback;

  /// Called when the range of items rendered by the grid changes.
  ///
  /// * This callback will only be called when item indices change.
  /// * It will not be called if items are re-rendered for other reasons _(e.g. a change in `isScrolling` or `data` params)_.
  void Function(
    int overscanColumnStartIndex,
    int overscanColumnStopIndex,
    int overscanRowStartIndex,
    int overscanRowStopIndex,
    int visibleColumnStartIndex,
    int visibleColumnStopIndex,
    int visibleRowStartIndex,
    int visibleRowStopIndex,
  ) get onItemsRendered => props['onItemsRendered'];
  set onItemsRendered(void Function(
    int overscanColumnStartIndex,
    int overscanColumnStopIndex,
    int overscanRowStartIndex,
    int overscanRowStopIndex,
    int visibleColumnStartIndex,
    int visibleColumnStopIndex,
    int visibleRowStartIndex,
    int visibleRowStopIndex,
  ) callback) => props['onItemsRendered'] = callback;

  /// Called when the grid scroll positions changes, as a result of user scrolling or scroll-to method calls.
  ///
  /// * `horizontalScrollDirection` and `verticalScrollDirection` are either "forward" or "backward".
  /// * `scrollUpdateWasRequested` is a boolean that
  ///   is true when the scroll was caused by `scrollTo()` or `scrollToItem()`,
  ///   and false if it was the result of a user interaction in the browser.
  void Function(
    String horizontalScrollDirection,
    int scrollLeft,
    int scrollTop,
    bool scrollUpdateWasRequested,
    String verticalScrollDirection,
  ) get onWindowScroll => props['onScroll'];
  set onWindowScroll(void Function(
    String horizontalScrollDirection,
    int scrollLeft,
    int scrollTop,
    bool scrollUpdateWasRequested,
    String verticalScrollDirection,
  ) callback) => props['onScroll'] = callback;
}
