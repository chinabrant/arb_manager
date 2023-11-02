import 'dart:ui';

/// 自定义的颜色内容
class CustomColor {
  /// 品牌色.

  /// 品牌主色.
  final Color primary;

  /// 品牌辅助色.
  final Color secondary;

  /// 涨跌色.

  ///  涨色.
  final Color originRaise;

  ///  跌色.
  final Color originFall;

  ///  平色.
  final Color originFlat;

  /// 交易买卖.
  ///
  ///  买.
  final Color buy;

  ///  卖.
  final Color sell;

  /// 底色.

  /// 系统底色.
  final Color background;

  /// 内容底色.
  final Color contentBackground;

  /// 提示底色.
  final Color tipsBackground;

  /// 备注底色.
  final Color remarksBackground;

  /// 空白加载底色.
  final Color emptyBackground;

  /// 弹窗底色.
  final Color alertBackground;

  /// Toast底色.
  final Color toastBackground;

  /// 文本颜色.

  /// 一级文本.
  final Color primaryText;

  /// 二级文本.
  final Color secondaryText;

  /// 三级文本.
  final Color tertiaryText;

  /// 备注文本/弱提示.
  final Color remarksText;

  /// 按钮文本.
  final Color buttonText;

  /// 强调/高亮文本.
  final Color highlightText;

  /// 链接/入口.
  final Color linkText;

  /// 提示.
  final Color tipsText;

  /// 分割线.

  /// 一级分割.
  final Color primaryDivider;

  /// 二级分割.
  final Color secondaryDivider;

  /// 其他.

  /// 进行/等待.
  final Color wait;

  /// 错误/危险.
  final Color error;

  /// 正确/安全.
  final Color correct;

  /// 取消/失败.
  final Color cancel;

  /// 预置.

  /// 辅助01.
  final Color extra01;

  /// 辅助02.
  final Color extra02;

  /// 辅助03.
  final Color extra03;

  /// 辅助04.
  final Color extra04;

  /// 辅助05.
  final Color extra05;

  /// 辅助06.
  final Color extra06;

  /// 辅助07.
  final Color extra07;

  /// 辅助08.
  final Color extra08;

  /// 辅助09.
  final Color extra09;

  /// 辅助10.
  final Color extra10;

  /// 辅助11.
  final Color extra11;

  /// 辅助12.
  final Color extra12;

  /// 辅助13.
  final Color extra13;

  /// 辅助14.
  final Color extra14;

  /// 辅助15.
  final Color extra15;

  /// 辅助16.
  final Color extra16;

  /// 辅助17.
  final Color extra17;

  /// 辅助18.
  final Color extra18;

  /// 辅助19.
  final Color extra19;

  /// 辅助20.
  final Color extra20;

  /// 辅助21.
  final Color extra21;

  /// 辅助22.
  final Color extra22;

  /// 辅助23.
  final Color extra23;

  /// 辅助24.
  final Color extra24;

  /// 辅助25.
  final Color extra25;

  /// 涨跌色是否互换
  bool isReverseRaiseFallColor = false;

  /// 在构造方法中，指定默认值
  CustomColor({
    this.primary = const Color(0xFFE92424),
    this.secondary = const Color(0xFFBC935C),
    this.originRaise = const Color(0xFFEB3838),
    this.originFall = const Color(0xFF00A93B),
    this.originFlat = const Color(0xFF666666),
    this.buy = const Color(0xFF007AFF),
    this.sell = const Color(0xFFFF7540),
    this.primaryText = const Color(0xFF181818),
    this.secondaryText = const Color(0xFF666666),
    this.tertiaryText = const Color(0xFF999999),
    this.remarksText = const Color(0xFFB9B9B9),
    this.buttonText = const Color(0xFFFFFFFF),
    this.highlightText = const Color(0xFFE92424),
    this.linkText = const Color(0xFFBC935C),
    this.tipsText = const Color(0xFFF1922E),
    this.background = const Color(0xFFF8F8F8),
    this.contentBackground = const Color(0xFFFFFFFF),
    this.tipsBackground = const Color(0xFFF5FAFC),
    this.remarksBackground = const Color(0xFFF8F8F8),
    this.emptyBackground = const Color(0xFFF3F3F3),
    this.alertBackground = const Color(0xFFFFFFFF),
    this.toastBackground = const Color(0xBB000000),
    this.primaryDivider = const Color(0xFFEEEEEE),
    this.secondaryDivider = const Color(0x8BEEEEEE),
    this.wait = const Color(0xFFF1922E),
    this.error = const Color(0xFFEF6666),
    this.correct = const Color(0xFF69C276),
    this.cancel = const Color(0xFF666666),

    /// TODO
    this.extra01 = const Color(0xFFF44345),
    this.extra02 = const Color(0xFFF44345),
    this.extra03 = const Color(0xFFF44345),
    this.extra04 = const Color(0xFFF44345),
    this.extra05 = const Color(0xFFA98EE0),
    this.extra06 = const Color(0xFFF44345),
    this.extra07 = const Color(0xFFF44345),
    this.extra08 = const Color(0xFFF44345),
    this.extra09 = const Color(0xFFF44345),
    this.extra10 = const Color(0xFFF44345),
    this.extra11 = const Color(0xFFF44345),
    this.extra12 = const Color(0xFFF44345),
    this.extra13 = const Color(0xFFF44345),
    this.extra14 = const Color(0xFFF44345),
    this.extra15 = const Color(0xFFF44345),
    this.extra16 = const Color(0xFFF44345),
    this.extra17 = const Color(0xFF35363D),
    this.extra18 = const Color(0xFF35363D),
    this.extra19 = const Color(0xFF35363D),
    this.extra20 = const Color(0xFF35363D),
    this.extra21 = const Color(0xFF35363D),
    this.extra22 = const Color(0xFF35363D),
    this.extra23 = const Color(0xFF35363D),
    this.extra24 = const Color(0xFF35363D),
    this.extra25 = const Color(0xFF35363D),
  });

  CustomColor copyWith({
    Color? primary,
    Color? secondary,
    Color? originRaise,
    Color? originFall,
    Color? originFlat,
    Color? buy,
    Color? sell,
    Color? primaryText,
    Color? secondaryText,
    Color? tertiaryText,
    Color? remarksText,
    Color? buttonText,
    Color? highlightText,
    Color? linkText,
    Color? tipsText,
    Color? background,
    Color? contentBackground,
    Color? tipsBackground,
    Color? remarksBackground,
    Color? emptyBackground,
    Color? alertBackground,
    Color? toastBackground,
    Color? primaryDivider,
    Color? secondaryDivider,
    Color? wait,
    Color? error,
    Color? correct,
    Color? cancel,
    Color? extra01,
    Color? extra02,
    Color? extra03,
    Color? extra04,
    Color? extra05,
    Color? extra06,
    Color? extra07,
    Color? extra08,
    Color? extra09,
    Color? extra10,
    Color? extra11,
    Color? extra12,
    Color? extra13,
    Color? extra14,
    Color? extra15,
    Color? extra16,
    Color? extra17,
    Color? extra18,
    Color? extra19,
    Color? extra20,
    Color? extra21,
    Color? extra22,
    Color? extra23,
    Color? extra24,
    Color? extra25,
  }) {
    return CustomColor(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      originRaise: originRaise ?? this.originRaise,
      originFall: originFall ?? this.originFall,
      originFlat: originFlat ?? this.originFlat,
      buy: buy ?? this.buy,
      sell: sell ?? this.sell,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      tertiaryText: tertiaryText ?? this.tertiaryText,
      remarksText: remarksText ?? this.remarksText,
      buttonText: buttonText ?? this.buttonText,
      highlightText: highlightText ?? this.highlightText,
      linkText: linkText ?? this.linkText,
      tipsText: tipsText ?? this.tipsText,
      background: background ?? this.background,
      contentBackground: contentBackground ?? this.contentBackground,
      tipsBackground: tipsBackground ?? this.tipsBackground,
      remarksBackground: remarksBackground ?? this.remarksBackground,
      emptyBackground: emptyBackground ?? this.emptyBackground,
      alertBackground: alertBackground ?? this.alertBackground,
      toastBackground: toastBackground ?? this.toastBackground,
      primaryDivider: primaryDivider ?? this.primaryDivider,
      secondaryDivider: secondaryDivider ?? this.secondaryDivider,
      wait: wait ?? this.wait,
      error: error ?? this.error,
      correct: correct ?? this.correct,
      cancel: cancel ?? this.cancel,

      /// TODO
      extra01: extra01 ?? this.extra01,
      extra02: extra02 ?? this.extra02,
      extra03: extra03 ?? this.extra03,
      extra04: extra04 ?? this.extra04,
      extra05: extra05 ?? this.extra05,
      extra06: extra06 ?? this.extra06,
      extra07: extra07 ?? this.extra07,
      extra08: extra08 ?? this.extra08,
      extra09: extra09 ?? this.extra09,
      extra10: extra10 ?? this.extra10,
      extra11: extra11 ?? this.extra11,
      extra12: extra12 ?? this.extra12,
      extra13: extra13 ?? this.extra13,
      extra14: extra14 ?? this.extra14,
      extra15: extra15 ?? this.extra15,
      extra16: extra16 ?? this.extra16,
      extra17: extra17 ?? this.extra17,
      extra18: extra18 ?? this.extra18,
      extra19: extra19 ?? this.extra19,
      extra20: extra20 ?? this.extra20,
      extra21: extra21 ?? this.extra21,
      extra22: extra22 ?? this.extra22,
      extra23: extra23 ?? this.extra23,
      extra24: extra24 ?? this.extra24,
      extra25: extra25 ?? this.extra25,
    );
  }
}

extension ColorSelector on CustomColor {
  Color get raise => isReverseRaiseFallColor ? originFall : originRaise;

  Color get fall => isReverseRaiseFallColor ? originRaise : originFall;

  Color get flat => originFlat;

  Color raiseFall(dynamic value) {
    if (value == null || !(value is num) || value == 0) {
      return flat;
    }
    return value > 0 ? raise : fall;
  }
}
