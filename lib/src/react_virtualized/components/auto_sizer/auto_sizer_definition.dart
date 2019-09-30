part of over_react_virtualized.wrapped_components;

final _AutoSizer = new ReactJsComponentFactoryProxy(interop.ReactVirtualized.AutoSizer);

/// The `AutoSizer` component decorates a React element and automatically manages width and height
/// properties so that decorated element fills the available space.
///
/// This simplifies usage of components like [FixedSizeGrid], [VariableSizeGrid], [FixedSizeList] and [VariableSizeList]
/// that require explicit dimensions:
///
///     @override
///     render() {
///       return (AutoSizer()
///         ..onResize = (newHeight, newWidth) {
///           print('The new dimensions of the window are: $newHeight, $newWidth');
///         }
///       )(
///        functionComponentProxy((props) => (FixedSizeList()
///          ..addProps(props)
///          ..innerElementType = 'ul'
///          ..itemCount = 1000
///          ..itemSize = 50
///          ..height = props['height']
///          ..width = props['width']
///        )(
///          functionComponentProxy((props) => (Dom.li()
///            ..addProps(props)
///            ..style = Map.from(JsBackedMap.backedBy(props['style']))
///            ..className = 'list-group-item'
///          )('Row ${props['index']}')),
///        )),
///      );
///    }
///
/// > See: [AutoSizerDefinition] for a full list of component prop options,
///   and [this readme](https://github.com/bvaughn/react-virtualized/blob/master/docs/usingAutoSizer.md)
///   for a full rundown of the JS component that it renders.
AutoSizerDefinition AutoSizer() => AutoSizerDefinition({});
class AutoSizerDefinition extends InteropComponentDefinition {
  AutoSizerDefinition(Map props) : super(_AutoSizer, props);

  /// Default height to use for initial render; useful for SSR
  int get defaultHeight => props['defaultHeight'];
  set defaultHeight(int value) => props['defaultHeight'] = value;

  /// Default width to use for initial render; useful for SSR
  int get defaultWidth => props['defaultWidth'];
  set defaultWidth(int value) => props['defaultWidth'] = value;

  /// Whether to disable the dynamic height calculation.
  bool get disableHeight => props['disableHeight'];
  set disableHeight(bool value) => props['disableHeight'] = value;

  /// Whether to disable the dynamic width calculation.
  bool get disableWidth => props['disableWidth'];
  set disableWidth(bool value) => props['disableWidth'] = value;

  /// Callback that is called when the size of the root element is changed.
  void Function(int newHeight, int newWidth) get onResize => props['onResize'];
  set onResize(void Function(int newHeight, int newWidth) callback) => props['onResize'] = callback;
}
