import 'package:flutter/widgets.dart';

/// 列的配置属性
class TableColumnConfig {
  /// 宽度或者占比（占比需要转成 int 类型去使用）
  final double widthOrFlex;

  /// 是否使用 flex 来计算宽度
  final bool useFlex;

  /// 获取背景颜色，需要 2 个组成斑马色
  final List<Color>? bgColors;

  /// 自定义单元格布局
  final Widget Function(int row) widgetForCell;

  /// 自定义表头布局
  final Widget Function() widgetForHeader;

  TableColumnConfig({
    this.widthOrFlex = 88,
    this.useFlex = false,
    this.bgColors,
    required this.widgetForCell,
    required this.widgetForHeader,
  });

  TableColumnConfig copyWith(Widget Function(int row) widgetForCell) {
    return TableColumnConfig(
      widthOrFlex: widthOrFlex,
      useFlex: useFlex,
      bgColors: bgColors,
      widgetForCell: widgetForCell,
      widgetForHeader: widgetForHeader,
    );
  }
}
