import 'dart:ui';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './custom_color.dart';
import './custom_font.dart';
import './theme_preferences.dart';
import 'type/theme_type.dart';

part './base_theme.dart';

class AppTheme extends ChangeNotifier with WidgetsBindingObserver {
  final ThemeType defaultThemeType;
  final ThemeType defaultDarkTheme;
  final ThemeType defaultLightTheme;
  final bool defaultRaiseFallReverse;
  ThemeType? _themeType;
  bool? _raiseFallReverse;
  BaseTheme? _customTheme;

  AppTheme.init(
      {this.defaultRaiseFallReverse = false,
      ThemeType? defaultThemeType,
      ThemeType? defaultDarkTheme,
      ThemeType? defaultLightTheme})
      : defaultThemeType = defaultThemeType ?? lightTheme,
        defaultLightTheme = defaultLightTheme ?? lightTheme,
        defaultDarkTheme = defaultDarkTheme ?? darkTheme {
    initConfig();
    _instance = this;
  }

  static AppTheme? _instance;

  factory AppTheme() {
    _instance ??= AppTheme.init();
    return _instance!;
  }

  /// 设置主题类型
  /// [persistence] 是否持久化
  ///
  _setThemeType(
    ThemeType type, {
    bool notify = true,
    bool persistence = true,
  }) {
    _themeType = type;
    ThemeType.current = type;
    _customTheme = type.theme
      ..customColor.isReverseRaiseFallColor = raiseFallReverse;
    if (persistence) {
      ThemePreferences.saveThemeType(type);
    }
    if (notify) {
      notifyListeners();
    }
  }

  ThemeType get themeType => _themeType ?? defaultThemeType;

  _setRaiseFallReverse(bool reverse, {bool notify = true}) {
    _raiseFallReverse = reverse;
    customTheme.customColor.isReverseRaiseFallColor = reverse;
    if (notify) {
      notifyListeners();
    }
  }

  bool get raiseFallReverse => _raiseFallReverse ?? defaultRaiseFallReverse;

  BaseTheme get customTheme => _customTheme ?? themeType.theme;

  ThemeData get themeData => customTheme.themeData;

  initConfig() async {
    ThemeType themeType;
    bool followSystem = await ThemePreferences.followSystem;
    if (followSystem) {
      var useDark = window.platformBrightness == Brightness.dark;
      themeType = useDark ? defaultDarkTheme : defaultLightTheme;
    } else {
      themeType = (await ThemePreferences.themeType) ?? defaultThemeType;
    }
    _setThemeType(themeType, notify: false);
    bool raiseFallReverse =
        (await ThemePreferences.raiseFallReverse) ?? defaultRaiseFallReverse;
    _setRaiseFallReverse(raiseFallReverse, notify: false);
    notifyListeners();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() async {
    super.didChangePlatformBrightness();

    final followSystem = await ThemePreferences.followSystem;
    if (followSystem) {
      var useDark = window.platformBrightness == Brightness.dark;
      ThemeType themeType = useDark ? defaultDarkTheme : defaultLightTheme;
      _setThemeType(themeType);
    }
  }

  Future<void> followSystem(bool followSystem) async {
    if (followSystem) {
      var useDark = window.platformBrightness == Brightness.dark;
      ThemeType themeType = useDark ? defaultDarkTheme : defaultLightTheme;
      _setThemeType(themeType);
      ThemePreferences.saveFollowSystem(true);
    } else {
      ThemeType themeType =
          (await ThemePreferences.themeType) ?? defaultThemeType;
      _setThemeType(themeType);
      ThemePreferences.saveFollowSystem(false);
    }
  }

  Future<void> setThemeType(ThemeType type) async {
    if (themeType != type) {
      _setThemeType(type);
      await ThemePreferences.saveThemeType(type);
    }
  }

  List<ThemeType> supportThemeType() => ThemeType.supportTheme;

  void setReverseRaiseFallColor(bool reverse) {
    _setRaiseFallReverse(reverse);
    ThemePreferences.saveRaiseFallReverse(reverse);
  }

  static T resolution<T>(BuildContext context, T defaultValue,
      {T? darkValue, T? whiteValue}) {
    return context.watch<AppTheme>().themeType.isDark
        ? (darkValue ?? defaultValue)
        : (whiteValue ?? defaultValue);
  }

  static String assets(BuildContext context, String assets,
      {bool onlyRead = false}) {
    if (assets.contains("[theme]")) {
      return Provider.of<AppTheme>(context, listen: !onlyRead).themeType.isDark
          ? assets.replaceFirst("[theme]", "dark")
          : assets.replaceFirst("[theme]", "white");
    }
    return assets;
  }

  static String svg(BuildContext context, String assets,
      {bool onlyRead = false}) {
    if (assets.contains("[theme]")) {
      return Provider.of<AppTheme>(context, listen: !onlyRead).themeType.isDark
          ? assets.replaceFirst("[theme]", "dark")
          : assets.replaceFirst("[theme]", "white");
    }
    return assets;
  }

  static Widget build(
      Widget Function(BuildContext context, AppTheme theme, Widget? child)
          builder,
      {Widget? child}) {
    return Consumer<AppTheme>(
      builder: builder,
      child: child,
    );
  }

  static AppTheme read(BuildContext context) {
    return context.read<AppTheme>();
  }

  static AppTheme watch(BuildContext context) {
    return context.watch<AppTheme>();
  }

  static CustomColor color(BuildContext context, {bool onlyRead = false}) {
    return Provider.of<AppTheme>(context, listen: !onlyRead)
        .customTheme
        .customColor;
  }

  static CustomFont font(BuildContext context, {bool onlyRead = false}) {
    return Provider.of<AppTheme>(context, listen: !onlyRead)
        .customTheme
        .customFont;
  }

  static Color colorPicker(
    BuildContext context, {
    required int light,
    int? dark,
  }) {
    return Color(themePicker(context, light: light, dark: dark));
  }

  static T themePicker<T>(
    BuildContext context, {
    required T light,
    T? dark,
  }) {
    return context.watch<AppTheme>().themeType.isDark ? (dark ?? light) : light;
  }

  static T raiseFall<T>(
    BuildContext context, {
    required T raise,
    required T fall,
    bool reverse = false,
  }) {
    final raiseFallReverse = context.watch<AppTheme>().raiseFallReverse;
    if (reverse) return raiseFallReverse ? raise : fall;
    return !raiseFallReverse ? raise : fall;
  }
}
