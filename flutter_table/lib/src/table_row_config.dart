import 'package:flutter/widgets.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class TableRowConfig {
  /// 是否是表头
  final bool isHeader;

  /// 行的背景颜色
  final Color bgColor;

  /// 行选中的背景色
  final Color bgSelectColor;

  /// 行的鼠标放置背景色
  final Color bgColorMuseOver;

  /// 行中的分割线颜色
  final Color dividerColor;

  /// 鼠标放置形状
  final MouseCursor mouseCursor;

  /// 滑动控制器
  final LinkedScrollControllerGroup scrollControllerGroup;

  /// 一行中需要固定的前面列的数量
  final int pinCount;

  /// 行宽（可空）
  /// 如果 [rowWidth] == null，行宽为各个 column 的宽度之和（加分割线）
  /// 如果 [rowWidth] != null，行宽固定，各个 column 的宽度采用固定 width 或者 flex 来划分
  final double? rowWidth;

  /// 行高
  final double rowHeight;

  /// 是否需要添加左边界线
  final bool needBorderLeft;

  /// 是否需要添加右边界线
  final bool needBorderRight;

  TableRowConfig({
    this.isHeader = false,
    required this.bgColor,
    required this.bgSelectColor,
    required this.bgColorMuseOver,
    required this.dividerColor,
    required this.scrollControllerGroup,
    this.pinCount = 0,
    this.rowHeight = 40,
    this.rowWidth,
    this.needBorderLeft = false,
    this.needBorderRight = true,
    this.mouseCursor = SystemMouseCursors.click,
  });
}
