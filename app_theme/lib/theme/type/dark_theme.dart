part of './theme_type.dart';

class DarkColor extends CustomColor {
  DarkColor()
      : super(
          primary: const Color(0xFFF54345),
          secondary: const Color(0xFFBC965F),
          originRaise: const Color(0xFFF13E3A),
          originFall: const Color(0xFF04933D),
          originFlat: const Color(0xFF81868F),
          buy: const Color(0xFF417FEA),
          sell: const Color(0xFFFF804F),
          primaryText: const Color(0xD8FFFFFF),
          secondaryText: const Color(0xA5FFFFFF),
          tertiaryText: const Color(0x72FFFFFF),
          remarksText: const Color(0x4DFFFFFF),
          buttonText: const Color(0xD8FFFFFF),
          highlightText: const Color(0xFFF54345),
          linkText: const Color(0xFFBC965F),
          tipsText: const Color(0xFFF29B41),
          background: const Color(0xFF14161A),
          contentBackground: const Color(0xFF1B1D24),
          tipsBackground: const Color(0x26BC965F),
          remarksBackground: const Color(0x8035363D),
          emptyBackground: const Color(0xFF81868F),
          alertBackground: const Color(0xFF262830),
          toastBackground: const Color(0xBB35363D),
          primaryDivider: const Color(0xFF0D0F11),
          secondaryDivider: const Color(0xFF35363D),
          wait: const Color(0xFFF29B41),
          error: const Color(0xFFEF6666),
          correct: const Color(0xFF69C276),
          cancel: const Color(0xFF81868F),
          extra01: const Color(0xFFD2A257),
          extra02: const Color(0xFF00C0CC),
          extra03: const Color(0xFF7594D0),
          extra04: const Color(0xFF5A86DC),
          extra05: const Color(0xFFB884E6),
          extra06: const Color(0xFFA18A8A),
          extra07: const Color(0x1AF54345),
          extra08: const Color(0xFF007AFF),
          extra09: const Color(0xFF4DA3F8),
          extra10: const Color(0xFF18B078),
          extra11: const Color(0xFFF54345),
          extra12: const Color(0xFF262830),
          extra13: const Color(0xFF592B2F),
          extra14: const Color(0xCCF54346),
          extra15: const Color(0xFFBC965F),
          extra16: const Color(0xFF332228),
          extra17: const Color(0xFF35363D),
          extra18: const Color(0xFF453425),
          extra19: const Color(0xFF212E3F),
        );
}

class DarkFont extends CustomFont {}

final CustomColor darkColor = DarkColor();

final CustomFont darkFont = DarkFont();

class DarkTheme extends BaseTheme {
  DarkTheme()
      : super(
          darkColor,
          darkFont,
          ThemeData.dark(),
          scaffoldBackgroundColor: darkColor.background,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: darkColor.primary,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: darkColor.contentBackground,
            foregroundColor: darkColor.primaryText,
          ),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(darkColor.extra17),
            trackColor: MaterialStateProperty.all(darkColor.extra17),
          ),
          dividerColor: darkColor.primaryDivider,
          textTheme: ThemeData.dark().textTheme.addFontFamilyFallback(),
          colorScheme: ThemeData.dark()
              .colorScheme
              .copyWith(brightness: Brightness.dark),
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: darkColor.background),
        );
}

class DarkThemeType extends ThemeType {
  DarkThemeType() : super._("dark", innerDef: true);

  @override
  ThemeBuilder get themeBuilder => () => DarkTheme();

  @override
  bool get isDark => true;
}

final ThemeType darkTheme = DarkThemeType();
