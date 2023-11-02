import 'dart:io';

import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle themedFont() =>
      merge(const TextStyle(fontFamily: 'packages/app_theme/DinPro',fontFamilyFallback: ["packages/app_theme/DinPro", "PingFang SC"],));

  TextStyle addFontCallback() {
    return merge(const TextStyle(
        fontFamilyFallback: ["packages/app_theme/DinPro", "PingFang SC"]));
  }
}

extension TextThemeExt on TextTheme {
  TextTheme addFontFamilyFallback() {
    return merge(TextTheme(
      headline1: headline1?.addFontCallback(),
      headline2: headline2?.addFontCallback(),
      headline3: headline3?.addFontCallback(),
      headline4: headline4?.addFontCallback(),
      headline5: headline5?.addFontCallback(),
      headline6: headline6?.addFontCallback(),
      subtitle1: subtitle1?.addFontCallback(),
      subtitle2: subtitle2?.addFontCallback(),
      bodyText1: bodyText1?.addFontCallback(),
      bodyText2: bodyText2?.addFontCallback(),
      caption: caption?.addFontCallback(),
      button: button?.addFontCallback(),
      overline: overline?.addFontCallback(),
    ));
  }
}