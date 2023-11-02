part of './app_theme.dart';

abstract class BaseTheme {
  final Brightness? brightness;
  final VisualDensity? visualDensity;
  final Color? primaryColor;
  final Color? primaryColorLight;
  final Color? primaryColorDark;
  final Color? canvasColor;
  final Color? shadowColor;
  final Color? scaffoldBackgroundColor;
  final Color? bottomAppBarColor;
  final Color? cardColor;
  final Color? dividerColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? selectedRowColor;
  final Color? unselectedWidgetColor;
  final Color? disabledColor;
  final ButtonThemeData? buttonTheme;
  final ToggleButtonsThemeData? toggleButtonsTheme;
  final Color? secondaryHeaderColor;
  final Color? backgroundColor;
  final Color? dialogBackgroundColor;
  final Color? indicatorColor;
  final Color? hintColor;
  final Color? errorColor;
  final Color? toggleableActiveColor;
  final TextTheme? textTheme;
  final TextTheme? primaryTextTheme;
  final InputDecorationTheme? inputDecorationTheme;
  final IconThemeData? iconTheme;
  final IconThemeData? primaryIconTheme;
  final SliderThemeData? sliderTheme;
  final TabBarTheme? tabBarTheme;
  final TooltipThemeData? tooltipTheme;
  final CardTheme? cardTheme;
  final ChipThemeData? chipTheme;
  final TargetPlatform? platform;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool? applyElevationOverlayColor;
  final PageTransitionsTheme? pageTransitionsTheme;
  final AppBarTheme? appBarTheme;
  final ScrollbarThemeData? scrollbarTheme;
  final BottomAppBarTheme? bottomAppBarTheme;
  final ColorScheme? colorScheme;
  final DialogTheme? dialogTheme;
  final FloatingActionButtonThemeData? floatingActionButtonTheme;
  final NavigationRailThemeData? navigationRailTheme;
  final Typography? typography;
  final NoDefaultCupertinoThemeData? cupertinoOverrideTheme;
  final SnackBarThemeData? snackBarTheme;
  final BottomSheetThemeData? bottomSheetTheme;
  final PopupMenuThemeData? popupMenuTheme;
  final MaterialBannerThemeData? bannerTheme;
  final DividerThemeData? dividerTheme;
  final ButtonBarThemeData? buttonBarTheme;
  final BottomNavigationBarThemeData? bottomNavigationBarTheme;
  final TimePickerThemeData? timePickerTheme;
  final TextButtonThemeData? textButtonTheme;
  final ElevatedButtonThemeData? elevatedButtonTheme;
  final OutlinedButtonThemeData? outlinedButtonTheme;
  final TextSelectionThemeData? textSelectionTheme;
  final DataTableThemeData? dataTableTheme;
  final CheckboxThemeData? checkboxTheme;
  final RadioThemeData? radioTheme;
  final SwitchThemeData? switchTheme;

  final MaterialColor? primarySwatch;
  final String? fontFamily;

  final ThemeData _themeData;

  /// 自定义的主题实现
  final CustomColor customColor;
  final CustomFont customFont;

  const BaseTheme(
    this.customColor,
    this.customFont,
    this._themeData, {
    this.brightness,
    this.visualDensity,
    this.primaryColor,
    this.primaryColorLight,
    this.primaryColorDark,
    this.canvasColor,
    this.shadowColor,
    this.scaffoldBackgroundColor,
    this.bottomAppBarColor,
    this.cardColor,
    this.dividerColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.splashFactory,
    this.selectedRowColor,
    this.unselectedWidgetColor,
    this.disabledColor,
    this.buttonTheme,
    this.toggleButtonsTheme,
    this.secondaryHeaderColor,
    this.backgroundColor,
    this.dialogBackgroundColor,
    this.indicatorColor,
    this.hintColor,
    this.errorColor,
    this.toggleableActiveColor,
    this.textTheme,
    this.primaryTextTheme,
    this.inputDecorationTheme,
    this.iconTheme,
    this.primaryIconTheme,
    this.sliderTheme,
    this.tabBarTheme,
    this.tooltipTheme,
    this.cardTheme,
    this.chipTheme,
    this.platform,
    this.materialTapTargetSize,
    this.applyElevationOverlayColor,
    this.pageTransitionsTheme,
    this.appBarTheme,
    this.scrollbarTheme,
    this.bottomAppBarTheme,
    this.colorScheme,
    this.dialogTheme,
    this.floatingActionButtonTheme,
    this.navigationRailTheme,
    this.typography,
    this.cupertinoOverrideTheme,
    this.snackBarTheme,
    this.bottomSheetTheme,
    this.popupMenuTheme,
    this.bannerTheme,
    this.dividerTheme,
    this.buttonBarTheme,
    this.bottomNavigationBarTheme,
    this.timePickerTheme,
    this.textButtonTheme,
    this.elevatedButtonTheme,
    this.outlinedButtonTheme,
    this.textSelectionTheme,
    this.dataTableTheme,
    this.checkboxTheme,
    this.radioTheme,
    this.switchTheme,
    this.primarySwatch,
    this.fontFamily,
  });

  ThemeData get themeData {
    return ThemeData(
      fontFamily: fontFamily,
      primarySwatch: primarySwatch,
      brightness: brightness ?? _themeData.brightness,
      visualDensity: visualDensity ?? _themeData.visualDensity,
      primaryColor: primaryColor ?? _themeData.primaryColor,
      primaryColorLight: primaryColorLight ?? _themeData.primaryColorLight,
      primaryColorDark: primaryColorDark ?? _themeData.primaryColorDark,
      canvasColor: canvasColor ?? _themeData.canvasColor,
      shadowColor: shadowColor ?? _themeData.shadowColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? _themeData.scaffoldBackgroundColor,
      bottomAppBarColor: bottomAppBarColor ?? _themeData.bottomAppBarColor,
      cardColor: cardColor ?? _themeData.cardColor,
      dividerColor: dividerColor ?? _themeData.dividerColor,
      focusColor: focusColor ?? _themeData.focusColor,
      hoverColor: hoverColor ?? _themeData.hoverColor,
      highlightColor: highlightColor ?? _themeData.highlightColor,
      splashColor: splashColor ?? _themeData.splashColor,
      splashFactory: splashFactory ?? _themeData.splashFactory,
      selectedRowColor: selectedRowColor ?? _themeData.selectedRowColor,
      unselectedWidgetColor:
          unselectedWidgetColor ?? _themeData.unselectedWidgetColor,
      disabledColor: disabledColor ?? _themeData.disabledColor,
      buttonTheme: buttonTheme ?? _themeData.buttonTheme,
      toggleButtonsTheme: toggleButtonsTheme ?? _themeData.toggleButtonsTheme,
      secondaryHeaderColor:
          secondaryHeaderColor ?? _themeData.secondaryHeaderColor,
      backgroundColor: backgroundColor ?? _themeData.backgroundColor,
      dialogBackgroundColor:
          dialogBackgroundColor ?? _themeData.dialogBackgroundColor,
      indicatorColor: indicatorColor ?? _themeData.indicatorColor,
      hintColor: hintColor ?? _themeData.hintColor,
      errorColor: errorColor ?? _themeData.errorColor,
      toggleableActiveColor:
          toggleableActiveColor ?? _themeData.toggleableActiveColor,
      //-----------以下三个只使用主题的值-------------------
      textTheme:
          fontFamily == null ? textTheme ?? _themeData.textTheme : textTheme,
      primaryTextTheme: fontFamily == null
          ? primaryTextTheme ?? _themeData.primaryTextTheme
          : primaryTextTheme,
      //-----------以上三个只使用主题的值-------------------
      inputDecorationTheme:
          inputDecorationTheme ?? _themeData.inputDecorationTheme,
      iconTheme: iconTheme ?? _themeData.iconTheme,
      primaryIconTheme: primaryIconTheme ?? _themeData.primaryIconTheme,
      sliderTheme: sliderTheme ?? _themeData.sliderTheme,
      tabBarTheme: tabBarTheme ?? _themeData.tabBarTheme,
      tooltipTheme: tooltipTheme ?? _themeData.tooltipTheme,
      cardTheme: cardTheme ?? _themeData.cardTheme,
      chipTheme: chipTheme ?? _themeData.chipTheme,
      platform: platform ?? _themeData.platform,
      materialTapTargetSize:
          materialTapTargetSize ?? _themeData.materialTapTargetSize,
      applyElevationOverlayColor:
          applyElevationOverlayColor ?? _themeData.applyElevationOverlayColor,
      pageTransitionsTheme:
          pageTransitionsTheme ?? _themeData.pageTransitionsTheme,
      appBarTheme: appBarTheme ?? _themeData.appBarTheme,
      scrollbarTheme: scrollbarTheme ?? _themeData.scrollbarTheme,
      bottomAppBarTheme: bottomAppBarTheme ?? _themeData.bottomAppBarTheme,
      colorScheme: colorScheme ?? _themeData.colorScheme,
      dialogTheme: dialogTheme ?? _themeData.dialogTheme,
      floatingActionButtonTheme:
          floatingActionButtonTheme ?? _themeData.floatingActionButtonTheme,
      navigationRailTheme:
          navigationRailTheme ?? _themeData.navigationRailTheme,
      typography: typography ?? _themeData.typography,
      cupertinoOverrideTheme:
          cupertinoOverrideTheme ?? _themeData.cupertinoOverrideTheme,
      snackBarTheme: snackBarTheme ?? _themeData.snackBarTheme,
      bottomSheetTheme: bottomSheetTheme ?? _themeData.bottomSheetTheme,
      popupMenuTheme: popupMenuTheme ?? _themeData.popupMenuTheme,
      bannerTheme: bannerTheme ?? _themeData.bannerTheme,
      dividerTheme: dividerTheme ?? _themeData.dividerTheme,
      buttonBarTheme: buttonBarTheme ?? _themeData.buttonBarTheme,
      bottomNavigationBarTheme:
          bottomNavigationBarTheme ?? _themeData.bottomNavigationBarTheme,
      timePickerTheme: timePickerTheme ?? _themeData.timePickerTheme,
      textButtonTheme: textButtonTheme ?? _themeData.textButtonTheme,
      elevatedButtonTheme:
          elevatedButtonTheme ?? _themeData.elevatedButtonTheme,
      outlinedButtonTheme:
          outlinedButtonTheme ?? _themeData.outlinedButtonTheme,
      textSelectionTheme: textSelectionTheme ?? _themeData.textSelectionTheme,
      dataTableTheme: dataTableTheme ?? _themeData.dataTableTheme,
      checkboxTheme: checkboxTheme ?? _themeData.checkboxTheme,
      radioTheme: radioTheme ?? _themeData.radioTheme,
      switchTheme: switchTheme ?? _themeData.switchTheme,
    );
  }
}
