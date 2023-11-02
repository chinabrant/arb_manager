import 'package:flutter/material.dart';

/// 自定义的字体内容
mixin CustomFontMixin {
  /// 一级导航.
  TextStyle primaryHeader({Color? color, bool bold = false});

  /// 二级导航.
  TextStyle secondaryHeader({Color? color, bool bold = false});

  /// 强调文本.
  TextStyle emphasize({Color? color, bool bold = false});

  /// 正文文本.
  TextStyle primaryContent({Color? color, bool bold = false});

  /// 次要文本.
  TextStyle secondaryContent({Color? color, bool bold = false});

  /// 辅助文本.
  TextStyle tertiaryContent({Color? color, bool bold = false});

  /// 备注文本.
  TextStyle remarks({Color? color, bool bold = false});

  /// 一级提示文本.
  TextStyle primaryTips({Color? color});

  /// 二级提示文本.
  TextStyle secondaryTips({Color? color});

  /// 标签文本.
  TextStyle label({Color? color});

  /// 文章标题.
  TextStyle title({Color? color});

  FontWeight fontWeight(bold) => bold ? FontWeight.bold : FontWeight.normal;
}

class CustomFont with CustomFontMixin {
  const CustomFont();
  @override
  TextStyle primaryHeader({Color? color, bool bold = false}) => TextStyle(
      fontSize: 20,
      height: 60 / 40,
      color: color,
      fontWeight: fontWeight(bold));

  @override
  TextStyle secondaryHeader({Color? color, bool bold = false}) => TextStyle(
      fontSize: 18,
      height: 56 / 36,
      color: color,
      fontWeight: fontWeight(bold));

  @override
  TextStyle emphasize({Color? color, bool bold = false}) => TextStyle(
      fontSize: 16,
      height: 48 / 32,
      color: color,
      fontWeight: fontWeight(bold));

  @override
  TextStyle primaryContent({Color? color, bool bold = false}) => TextStyle(
      fontSize: 15,
      height: 44 / 30,
      color: color,
      fontWeight: fontWeight(bold));

  @override
  TextStyle secondaryContent({Color? color, bool bold = false}) => TextStyle(
      fontSize: 14,
      height: 40 / 28,
      color: color,
      fontWeight: fontWeight(bold));

  @override
  TextStyle tertiaryContent({Color? color, bool bold = false}) => TextStyle(
      fontSize: 13,
      height: 36 / 26,
      color: color,
      fontWeight: fontWeight(bold));

  @override
  TextStyle remarks({Color? color, bool bold = false}) => TextStyle(
      fontSize: 12,
      height: 32 / 24,
      color: color,
      fontWeight: fontWeight(bold));

  @override
  TextStyle primaryTips({Color? color}) => TextStyle(
        fontSize: 11,
        height: 30 / 22,
        color: color,
      );

  @override
  TextStyle secondaryTips({Color? color}) => TextStyle(
        fontSize: 10,
        height: 28 / 20,
        color: color,
      );

  @override
  TextStyle label({Color? color}) => TextStyle(
        fontSize: 9,
        height: 26 / 18,
        color: color,
      );

  @override
  TextStyle title({Color? color}) => TextStyle(
        fontSize: 24,
        height: 72 / 48,
        color: color,
      );
}
