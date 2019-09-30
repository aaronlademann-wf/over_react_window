part of over_react_window.wrapped_components;

final JsColumn = new ReactJsComponentFactoryProxy(interop.ReactVirtualized.Column);

/// TODO
///
/// Accepts a list of [Column]s as children.
///
/// Use [ColumnComponent] as the type for any callback refs to gain access to instance methods.
ColumnDefinition Column() => ColumnDefinition({});
class ColumnDefinition extends InteropComponentDefinition {
  ColumnDefinition(Map props) : super(JsColumn, props);

  /// Callback responsible for returning a cell's data, given its dataKey.
  dynamic Function(JsMap props) get cellDataGetter => props['cellDataGetter'];
  set cellDataGetter(dynamic Function(JsMap props) callback) => props['cellDataGetter'] = callback;

  /// Callback responsible for rendering a cell's contents. Learn more
  ///
  /// TODO: Is this dynamic, or ReactElement?
  dynamic Function(JsMap props) get cellRenderer => props['cellRenderer'];
  set cellRenderer(dynamic Function(JsMap props) callback) => props['cellRenderer'] = callback;

  /// Additional data passed to this column's cellDataGetter.
  ///
  /// Use this object to relay action-creators or relational data.
  Map<String, dynamic> get columnData => props['columnData'];
  set columnData(Map<String, dynamic> value) => props['columnData'] = value;

  /// Uniquely identifies the row-data attribute corresponding to this cell.
  ///
  /// (eg this might be "name" in an array of user objects)
  ///
  /// __Required__
  String get dataKey => props['dataKey'];
  set dataKey(String value) => props['dataKey'] = value;

  /// Default sort order when clicked for the first time.
  ///
  /// Valid options include "ASC" and "DESC".
  ///
  /// Defaults value: "ASC"
  dynamic/*SortDirection*/ get defaultSortDirection => props['defaultSortDirection'];
  set defaultSortDirection(dynamic/*SortDirection*/ value) => props['defaultSortDirection'] = value;

  /// If sort is enabled for the parent [Table], disable it for this [Column].
  bool get disableSort => props['disableSort'];
  set disableSort(bool value) => props['disableSort'] = value;

  /// Flex grow style.
  ///
  /// Default value: 0
  int get flexGrow => props['flexGrow'];
  set flexGrow(int value) => props['flexGrow'] = value;

  /// Flex shrink style.
  ///
  /// Default value: 1
  int get flexShrink => props['flexShrink'];
  set flexShrink(int value) => props['flexShrink'] = value;

  /// CSS class to apply to this [Column]'s header.
  String get headerClassName => props['headerClassName'];
  set headerClassName(String value) => props['headerClassName'] = value;

  /// Optional callback responsible for rendering a [Column]'s header column.
  dynamic Function(JsMap props) get headerRenderer => props['headerRenderer'];
  set headerRenderer(dynamic Function(JsMap props) callback) => props['headerRenderer'] = callback;

  /// Optional inline style to apply to this [Column]'s header.
  Map get headerStyle => props['headerStyle'];
  set headerStyle(Map value) => props['headerStyle'] = value;

  /// Header label for this column
  @override
  dynamic/*Node*/ get label => props['label'];
  @override
  set label(covariant dynamic/*Node*/ value) => props['label'] = value;

  /// Maximum width of [Column].
  ///
  /// This property will only be used if [flexGrow] is greater than 0.
  int get maxWidth => props['maxWidth'];
  set maxWidth(int value) => props['maxWidth'] = value;

  /// Minimum width of [Column].
  int get minWidth => props['minWidth'];
  set minWidth(int value) => props['minWidth'] = value;

  /// Flex basis (width) for this [Column].
  ///
  /// This value can grow or shrink based on [flexGrow] and [flexShrink] properties
  ///
  /// __Required__
  @override
  int get width => props['width'];
  @override
  set width(covariant int value) => props['width'] = value;
}

@JS('ReactVirtualized.Column')
class ColumnComponent {
  // If any methods are ever added for the underlying JS component, add them here.
}

