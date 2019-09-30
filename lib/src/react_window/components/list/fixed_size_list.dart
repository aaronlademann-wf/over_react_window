part of over_react_window.wrapped_components;

final _FixedSizeList = new ReactJsComponentFactoryProxy(interop.ReactWindow.FixedSizeList);

/// Renders a "windowed" list of items that all have a dimension of
/// [FixedSizeListDefinition.itemSize] along the scrolling axis.
///
/// > See: [FixedSizeListDefinition] for a full list of component prop options.
///
/// ### Defining item children
///
/// Use [functionComponentProxy] as the single child, which will proxy an `index` and `style` prop to the
/// component returned inside the proxy body as shown in the example below.
///
///     @override
///     render() {
///       return (FixedSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = 1000
///         ..itemSize = 50
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
/// If [FixedSizeListDefinition.useIsScrolling] is enabled for the list,
/// an `isScrolling` boolean prop will also be proxied:
///
///     @override
///     render() {
///       return (FixedSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = 1000
///         ..itemSize = 50
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
/// If [FixedSizeListDefinition.itemData] is defined for the list,
/// a `data` prop will also be proxied:
///
///     const List<Map<String, String>> itemData = [
///       {'name': 'foo'},
///       {'name': 'bar'},
///       {'name': 'baz'},
///     ];
///
///     @override
///     render() {
///       return (FixedSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = itemData.length
///         ..itemSize = 50
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
/// The [FixedSizeList] component exposes two methods:
/// [FixedSizeListComponent.scrollTo] and [FixedSizeListComponent.scrollToItem].
///
/// You can call them by utilizing a callback `ref` like so:
///
///     FixedSizeListComponent componentRef;
///
///     @override
///     render() {
///       return (FixedSizeList()
///         ..innerElementType = 'ul'
///         ..itemCount = 1000
///         ..itemSize = 50
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
///     void someMethodOrFunction() {
///       componentRef.scrollTo(someScrollOffsetValue);
///     }
///
///     void someOtherMethodOrFunction() {
///       componentRef.scrollToItem(someScrollOffsetValue);
///     }
///
/// > Related: [VariableSizeList]
FixedSizeListDefinition FixedSizeList() => FixedSizeListDefinition({});
class FixedSizeListDefinition extends _AbstractListDefinition {
  FixedSizeListDefinition(Map props) : super(_FixedSizeList, props);

  /// Size of a item in the direction being windowed.
  ///
  /// * For vertical lists, this is the row height.
  /// * For horizontal lists, this is the column width.
  int get itemSize => props['itemSize'];
  set itemSize(int value) => props['itemSize'] = value;
}

@JS('ReactWindow.FixedSizeList')
class FixedSizeListComponent {
  /// Scroll to the specified [offset] (`scrollTop` or `scrollLeft`, depending on the value of the direction prop).
  external void scrollTo(int offset);

  /// Scroll to the specified item at [index].
  ///
  /// By default, the [FixedSizeList] will scroll as little as possible to ensure the item is visible.
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
}
