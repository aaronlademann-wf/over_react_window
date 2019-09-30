part of over_react_window.wrapped_components;

/// An abstract definition of typed props shared by [FixedSizeList] and [VariableSizeList].
abstract class _AbstractListDefinition extends _AbstractWindowComponentDefinition<dynamic> {
  _AbstractListDefinition(ReactJsComponentFactoryProxy factoryProxy, Map props) : super(factoryProxy, props);

  /// Scroll offset for initial render.
  ///
  /// For vertical lists, this affects scrollTop. For horizontal lists, this affects scrollLeft.
  ///
  /// Default value: 0
  int get initialScrollOffset => props['initialScrollOffset'];
  set initialScrollOffset(int value) => props['initialScrollOffset'] = value;

  /// By default, lists will use an item's index as its key.
  ///
  /// This is okay if:
  ///
  /// * Your collections of items is never sorted or modified
  /// * Your item renderer is not stateful and does not extend PureComponent
  ///
  /// If your list does not satisfy the above constraints, use the `itemKey` prop to specify your own keys for items:
  ///
  ///     @override
  ///     render() {
  ///       return (FixedSizeList()
  ///         // The other required props would need to be here as well
  ///         ..itemKey = (index, data) {
  ///           // Find the item for the specified indices.
  ///           // In this case "data" is a List that was passed to FixedSizeList as `props.itemData`.
  ///           const item = data[index];
  ///
  ///           // Return a value that uniquely identifies this item.
  ///           return item['id'];
  ///         }
  ///       )(
  ///         // ... child renderer ...
  ///       );
  ///     }
  dynamic Function(int index, dynamic data) get itemKey => props['itemKey'];
  set itemKey(dynamic Function(int index, dynamic data) callback) => props['itemKey'] = callback;

  /// Total number of items in the list. Note that only a few items will be rendered and displayed at a time.
  int get itemCount => props['itemCount'];
  set itemCount(int value) => props['itemCount'] = value;

  /// Layout/orientation of the list. Acceptable values are:
  ///
  /// * vertical - Up/down scrolling.
  /// * horizontal - Left/right scrolling.
  ///
  /// Note that lists may scroll in both directions (depending on CSS)
  /// but content will only be windowed in the layout direction specified.
  ///
  /// Default value: "vertical"
  String get layout => props['layout'];
  set layout(String value) => props['layout'] = value;

  /// The number of items (rows or columns) to render outside of the visible area.
  ///
  /// This property can be important for two reasons:
  ///
  /// * Overscanning by one row or column allows the tab key to focus on the next (not yet visible) item.
  /// * Overscanning slightly can reduce or prevent a flash of empty space when a user first starts scrolling.
  ///
  /// Note that overscanning too much can negatively impact performance.
  ///
  /// Default value: 1
  int get overscanCount => props['overscanCount'];
  set overscanCount(int value) => props['overscanCount'] = value;

  /// Called when the range of items rendered by the list changes.
  ///
  /// * This callback will only be called when item indices change.
  /// * It will not be called if items are re-rendered for other reasons _(e.g. a change in `isScrolling` or `data` params)_.
  void Function(
    int overscanStartIndex,
    int overscanStopIndex,
    int visibleStartIndex,
    int visibleStopIndex,
  ) get onItemsRendered => props['onItemsRendered'];
  set onItemsRendered(void Function(int overscanStartIndex, int overscanStopIndex, int visibleStartIndex, int visibleStopIndex) callback) => props['onItemsRendered'] = callback;

  /// Called when the list scroll positions changes, as a result of user scrolling or scroll-to method calls.
  ///
  /// * `scrollDirection` is either "forward" or "backward".
  /// * `scrollUpdateWasRequested` is a boolean that
  ///   is true when the scroll was caused by `scrollTo()` or `scrollToItem()`,
  ///   and false if it was the result of a user interaction in the browser.
  void Function(
    String scrollDirection,
    int scrollOffset,
    bool scrollUpdateWasRequested,
  ) get onWindowScroll => props['onScroll'];
  set onWindowScroll(void Function(String scrollDirection, int scrollOffset, bool scrollUpdateWasRequested) callback) => props['onScroll'] = callback;
}
