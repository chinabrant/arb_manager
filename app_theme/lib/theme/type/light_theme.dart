part of './theme_type.dart';

/// 配置自定义白色主题内容

class LightColor extends CustomColor {
  LightColor()
      : super(
          primary: const Color(0xFFE92424),
          secondary: const Color(0xFFBC935C),
          originRaise: const Color(0xFFEB3838),
          originFall: const Color(0xFF00A93B),
          originFlat: const Color(0xFF898E97),
          buy: const Color(0xFF007AFF),
          sell: const Color(0xFFFF7540),
          primaryText: const Color(0xFF181818),
          secondaryText: const Color(0xFF666666),
          tertiaryText: const Color(0xFF999999),
          remarksText: const Color(0xFFB9B9B9),
          buttonText: const Color(0xFFFFFFFF),
          highlightText: const Color(0xFFE92424),
          linkText: const Color(0xFFBC935C),
          tipsText: const Color(0xFFF1922E),
          background: const Color(0xFFF8F8F8),
          contentBackground: const Color(0xFFFFFFFF),
          tipsBackground: const Color(0xFFF5FAFC),
          remarksBackground: const Color(0xFFF8F8F8),
          emptyBackground: const Color(0xFFF3F3F3),
          alertBackground: const Color(0xFFFFFFFF),
          toastBackground: const Color(0xA6000000),
          primaryDivider: const Color(0xFFEEEEEE),
          secondaryDivider: const Color(0x8BEEEEEE),
          wait: const Color(0xFFF1922E),
          error: const Color(0xFFEF6666),
          correct: const Color(0xFF69C276),
          cancel: const Color(0xFF666666),
          extra01: const Color(0xFFD2A257),
          extra02: const Color(0xFF00C0CC),
          extra03: const Color(0xFF7594D0),
          extra04: const Color(0xFF5A86DC),
          extra05: const Color(0xFFB884E6),
          extra06: const Color(0xFFA18A8A),
          extra07: const Color(0x0FE92424),
          extra08: const Color(0xFF007AFF),
          extra09: const Color(0xFF4DA3F8),
          extra10: const Color(0xFF18B078),
          extra11: const Color(0xFFF54345),
          extra12: const Color(0xFFF4F6F7),
          extra13: const Color(0xFFF8BDBD),
          extra14: const Color(0xCCE92424),
          extra15: const Color(0xFFBC935C),
          extra16: const Color(0xFFFEEEEE),
          extra17: const Color(0xFFDDDDDD),
          extra18: const Color(0xFFFFECD8),
          extra19: const Color(0xFFE5F2FF),
        );
}

class LightFont extends CustomFont {}

final CustomColor lightColor = LightColor();

final CustomFont lightFont = LightFont();

class WhiteTheme extends BaseTheme {
  WhiteTheme()
      : super(
          lightColor, lightFont, ThemeData.light(),
          scaffoldBackgroundColor: lightColor.background,
          dividerColor: lightColor.primaryDivider,

          /// 覆盖系统主题内容
          primaryColor: lightColor.primary,
          highlightColor: Colors.transparent,
          // 引入Theme来强制tabbar水波纹等效果不生效
          splashColor: Colors.transparent,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: lightColor.primary,
          ),
          colorScheme: ThemeData.light()
              .colorScheme
              .copyWith(brightness: Brightness.light),
          appBarTheme: AppBarTheme(
              backgroundColor: lightColor.contentBackground,
              foregroundColor: lightColor.primaryText),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(lightColor.extra17),
            trackColor: MaterialStateProperty.all(lightColor.extra17),
          ),
          textTheme: ThemeData.light().textTheme.addFontFamilyFallback(),
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: lightColor.background),
        );
}

class LightThemeType extends ThemeType {
  LightThemeType() : super._("white", innerDef: true);

  @override
  ThemeBuilder get themeBuilder => () => WhiteTheme();

  @override
  bool get isDark => false;
}

final ThemeType lightTheme = LightThemeType();
