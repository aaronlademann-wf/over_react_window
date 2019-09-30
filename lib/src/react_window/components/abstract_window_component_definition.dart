part of over_react_window.wrapped_components;

/// An abstract definition of typed props shared by all top-level React Window components:
///
/// * [FixedSizeList]
/// * [VariableSizeList]
/// * [FixedSizeGrid]
/// * [VariableSizeGrid].
abstract class _AbstractWindowComponentDefinition<D> extends InteropComponentDefinition {
  _AbstractWindowComponentDefinition(ReactJsComponentFactoryProxy factoryProxy, Map props) : super(factoryProxy, props);

  /// Determines the direction of text and horizontal scrolling.
  ///
  /// Possible values are:
  ///
  /// * "ltr" (default)
  /// * "rtl"
  ///
  /// For grid components, this value is also automatically used as the
  /// [CSS direction style](https://developer.mozilla.org/en-US/docs/Web/CSS/direction).
  String get direction => props['direction'];
  set direction(String value) => props['direction'] = value;

  /// The height of the window in which children will be rendered.
  ///
  /// ### For List Components:
  ///
  /// * For vertical lists, this must be a number.
  ///   It affects the number of rows that will be rendered (and displayed) at any given time.
  /// * For horizontal lists, this can be a number or a string (e.g. "50%").
  ///
  /// ### For Grid Components:
  ///
  /// This affects the number of rows that will be rendered (and displayed) at any given time.
  ///
  /// * The value must be a number
  @override
  D get height => props['height'];
  @override
  set height(covariant D value) => props['height'] = value;

  /// The width of the window in which children will be rendered.
  ///
  /// ### For List Components:
  ///
  /// * For horizontal lists, this must be a number.
  ///   It affects the number of columns that will be rendered (and displayed) at any given time.
  /// * For vertical lists, this can be a number or a string (e.g. "50%").
  ///
  /// ### For Grid Components:
  ///
  /// This affects the number of columns that will be rendered (and displayed) at any given time.
  ///
  /// * The value must be a number
  @override
  D get width => props['width'];
  @override
  set width(covariant D value) => props['width'] = value;

  /// Ref to attach to the inner container element.
  ///
  /// This is an advanced property.
  /*Ref*/ get innerRef => props['innerRef'];
  set innerRef(/*Ref*/ value) => props['innerRef'] = value;

  /// Tag name passed to document.createElement to create the inner container element.
  ///
  /// This is an advanced property; in most cases, the default ("div") should be used.
  ///
  /// Default value: 'div'
  String get innerElementType => props['innerElementType'];
  set innerElementType(String value) => props['innerElementType'] = value;

  /// Ref to attach to the outer container element.
  ///
  /// This is an advanced property.
  /*Ref*/ get outerRef => props['outerRef'];
  set outerRef(/*Ref*/ value) => props['outerRef'] = value;

  /// Tag name passed to document.createElement to create the outer container element.
  ///
  /// This is an advanced property; in most cases, the default ("div") should be used.
  ///
  /// Default value: 'div'
  String get outerElementType => props['outerElementType'];
  set outerElementType(String value) => props['outerElementType'] = value;

  /// Contextual data to be passed to the item renderer as a `data` prop.
  ///
  /// This is a light-weight alternative to React's built-in context API.
  ///
  /// Item data is useful for item renderers that are class components.
  ///
  /// > See [FixedSizeList], [VariableSizeList], [FixedSizeGrid] and [VariableSizeGrid] for
  ///   more information and examples.
  dynamic get itemData => props['itemData'];
  set itemData(dynamic value) => props['itemData'] = value;

  /// This parameter can be used to show a placeholder row or column while the window is being scrolled.
  ///
  /// Setting this to `true` causes a boolean `isScrolling` prop to be passed to the children render function.
  ///
  /// Note that using this parameter will result in an additional render call after scrolling has stopped
  /// (when `isScrolling` changes from true to false).
  ///
  /// Default value: `false`
  ///
  /// > See [FixedSizeList], [VariableSizeList], [FixedSizeGrid] and [VariableSizeGrid] for
  ///   more information and examples.
  bool get useIsScrolling => props['useIsScrolling'];
  set useIsScrolling(bool value) => props['useIsScrolling'] = value;
}
