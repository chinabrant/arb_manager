import 'package:shared_preferences/shared_preferences.dart';
import 'type/theme_type.dart';

class ThemePreferences {
  static const String _followSystem = "cms_theme_follow_system";
  static const String _themeType = "cms_theme_type_string";
  static const String _raiseFallReverse = "cms_theme_raise_fall_reverse";

  static Future<bool> get followSystem async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_followSystem) == true.toString();
  }

  static Future<bool> saveFollowSystem(bool flag) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_followSystem, flag.toString());
  }

  static Future<ThemeType?> get themeType async {
    final prefs = await SharedPreferences.getInstance();
    final type = prefs.getString(_themeType);
    return ThemeType.from(type);
  }

  static Future<bool> saveThemeType(ThemeType type) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_themeType, type.key);
  }

  static Future<bool?> get raiseFallReverse async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_raiseFallReverse);
  }

  static Future<bool> saveRaiseFallReverse(bool reverse) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_raiseFallReverse, reverse);
  }
}
