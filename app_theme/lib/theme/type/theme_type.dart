import 'dart:ui';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../custom_color.dart';
import '../custom_font.dart';
import '../theme_tools.dart';

part './dark_theme.dart';
part './light_theme.dart';

typedef ThemeBuilder = BaseTheme Function();

abstract class ThemeType {
  static final Map<String, ThemeType> _themeTypeMap = {};

  static ThemeType? current;

  final String key;

  ThemeType._(this.key, {bool innerDef = false}) {
    /// 内部预定义的类型不能覆盖外部定义
    if (innerDef && _themeTypeMap.containsKey(key)) {
      return;
    }
    _themeTypeMap.putIfAbsent(key, () => this);
  }

  ThemeType(String key) : this._(key, innerDef: false);

  ThemeBuilder get themeBuilder;

  BaseTheme get theme => themeBuilder.call();

  bool get isDark;

  static ThemeType? from(String? key) {
    if (key == null) return null;
    return _themeTypeMap[key];
  }

  static List<ThemeType> get supportTheme => _themeTypeMap.values.toList();
}
