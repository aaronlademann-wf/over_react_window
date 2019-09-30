part of over_react_window.wrapped_components;

final _VariableSizeList = new ReactJsComponentFactoryProxy(interop.ReactWindow.VariableSizeList);

/// Renders a "windowed" list of items that have varying dimensions
/// _(defined using the [VariableSizeListDefinition.itemSize] function)_ along the scrolling axis.
///
/// > See: [VariableSizeListDefinition] for a full list of component prop options.
///
/// ### Defining item children
///
/// Use [functionComponentProxy] as the single child, which will proxy an `index` and `style` prop to the
/// component returned inside the proxy body as shown in the example below.
///
///     // These row heights are arbitrary.
///     // Yours should be based on the content of the row.
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = 1000
///         ..estimatedItemSize = 50
///         ..itemSize = ((index) => rowHeights[i])
///         ..height = 150
///         ..width = 300
///       )(
///         functionComponentProxy((props) => (Dom.li()
///           ..addProps(props)
///           ..style = Map.from(JsBackedMap.backedBy(props['style']))
///           ..className = 'list-group-item'
///         )('Row ${props['index']}')),
///       );
///     }
///
/// If [VariableSizeListDefinition.useIsScrolling] is enabled for the list,
/// an `isScrolling` boolean prop will also be proxied:
///
///     // These row heights are arbitrary.
///     // Yours should be based on the content of the row.
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = 1000
///         ..estimatedItemSize = 50
///         ..itemSize = ((index) => rowHeights[i])
///         ..height = 150
///         ..width = 300
///         ..useIsScrolling = true
///       )(
///         functionComponentProxy((props) => (Dom.li()
///           ..addProps(props)
///           ..style = Map.from(JsBackedMap.backedBy(props['style']))
///           ..className = 'list-group-item'
///         )('Row ${props['index']} (scrolling: ${props['isScrolling']})')),
///       );
///     }
///
/// If [VariableSizeListDefinition.itemData] is defined for the list,
/// a `data` prop will also be proxied:
///
///     const List<Map<String, String>> itemData = [
///       {'name': 'foo'},
///       {'name': 'bar'},
///       {'name': 'baz'},
///     ];
///
///     // These row heights are arbitrary.
///     // Yours should be based on the content of the row.
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = itemData.length
///         ..estimatedItemSize = 50
///         ..itemSize = ((index) => rowHeights[i])
///         ..height = 150
///         ..width = 300
///         ..itemData = itemData
///       )(
///         functionComponentProxy((props) {
///           final itemData = props['data'][props['index']];
///           return (Dom.li()
///             ..addProps(props)
///             ..style = Map.from(JsBackedMap.backedBy(props['style']))
///             ..className = 'list-group-item'
///           )(itemData['name']);
///         }),
///       );
///     }
///
/// ### Calling instance methods
///
/// The [VariableSizeList] component exposes three methods:
/// [VariableSizeListComponent.scrollTo], [VariableSizeListComponent.scrollToItem]
/// and [VariableSizeListComponent.resetAfterIndex].
///
/// You can call them by utilizing a callback `ref` like so:
///
///     VariableSizeListComponent componentRef;
///
///     // These row heights are arbitrary.
///     // Yours should be based on the content of the row.
///     final rowHeights = List<int>.generate(1000, (index) => 25 + Random().nextInt(50));
///
///     @override
///     render() {
///       return (VariableSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = 1000
///         ..estimatedItemSize = 50
///         ..itemSize = ((index) => rowHeights[i])
///         ..height = 150
///         ..width = 300
///         ..ref = (ref) {
///           componentRef = ref as FixedSizeListComponent;
///         }
///       )(
///         functionComponentProxy((props) => (Dom.li()
///           ..addProps(props)
///           ..style = Map.from(JsBackedMap.backedBy(props['style']))
///           ..className = 'list-group-item'
///         )('Row ${props['index']}')),
///       );
///     }
///
///     void handleItemSizeChange(List<int> indexOfItemThatChangedSize) {
///       componentRef.resetAfterIndex(indexOfItemThatChangedSize);
///     }
///
///     void someMethodOrFunction() {
///       componentRef.scrollTo(someScrollOffsetValue);
///     }
///
///     void someOtherMethodOrFunction() {
///       componentRef.scrollToItem(someScrollOffsetValue);
///     }
///
/// > Related: [FixedSizeList]
VariableSizeListDefinition VariableSizeList() => VariableSizeListDefinition({});
class VariableSizeListDefinition extends _AbstractListDefinition {
  VariableSizeListDefinition(Map props) : super(_VariableSizeList, props);

  /// Estimated size of a item in the direction being windowed.
  ///
  /// * For vertical lists, this is the row height.
  /// * For horizontal lists, this is the column width.
  ///
  /// This value is used to calculated the estimated total size of a list before its items have all been measured.
  /// The total size impacts user scrolling behavior.
  /// It is updated whenever new items are measured.
  int get estimatedItemSize => props['estimatedItemSize'];
  set estimatedItemSize(int value) => props['estimatedItemSize'] = value;

  /// Returns the size of a item found at the provided `index` in the direction being windowed.
  ///
  /// * For vertical lists, this is the row height.
  /// * For horizontal lists, this is the column width.
  int Function(int index) get itemSize => props['itemSize'];
  set itemSize(int Function(int index) value) => props['itemSize'] = value;
}

@JS('ReactWindow.VariableSizeList')
class VariableSizeListComponent {
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
  external void scrollToItem(int index, [String align = 'auto']);

  /// Clears that cached data for all items after (and including) the specified [index].
  ///
  /// [VariableSizeList] caches offsets and measurements for each index for performance purposes.
  ///
  /// This method should be called whenever an item's size changes. _(Note that this is not a typical occurrence.)_
  ///
  /// By default the list will automatically re-render after the index is reset.
  /// If you would like to delay this re-render _(e.g. until a state update has completed in the parent component)_,
  /// specify a value of `false` for [shouldForceUpdate].
  external void resetAfterIndex(int index, [bool shouldForceUpdate = true]);
}
