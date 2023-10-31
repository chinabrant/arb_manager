import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

import 'table_column_config.dart';
import 'table_row.dart';

class TableConfig {
  /// 表格中每列的配置
  final List<TableColumnConfig> columnConfigs;

  /// 数据行数，不包含表头
  final int rowCount;

  /// 表格的固定宽度
  /// null 代表非固定宽度，非 null 代表固定宽度
  final double? fixedWidth;

  /// 滑动触发加载更多的距离设置（到最底部的距离）
  final double loadMoreTriggerExtent;

  /// 是否需要添加顶部边界线
  final bool needBorderTop;

  /// 是否需要添加左边界线
  final bool needBorderLeft;

  /// 是否需要添加右边界线
  final bool needBorderRight;

  /// 行的鼠标放置背景色
  final Color bgColorMuseOver;

  /// 行中的分割线颜色
  final Color dividerColor;

  /// 鼠标放置形状
  final MouseCursor mouseCursor;

  /// 组成行背景的斑马线色值
  final List<Color> zebraColors;

  /// 行选中的背景色
  final Color rowSelectColor;

  /// 表头是否固定，默认为 true
  final bool pinColumnHeader;

  /// 要固定的列数, 默认为0
  /// 会默认按此设置固定前面指定列数
  final int pinColumnCount;

  /// 表头高度
  final double headerHeight;

  /// 单元行高度
  final double rowHeight;

  /// 是否支持加载更多
  final bool supportLoadMore;

  /// 最后一行的高度
  final double lastRowHeight;

  /// row 的自定义包括容器
  final Widget Function(int, ATableRow)? tableRowContainer;

  TableConfig({
    required this.columnConfigs,
    required this.rowCount,
    this.fixedWidth,
    this.loadMoreTriggerExtent = 50,
    this.needBorderTop = false,
    this.needBorderLeft = false,
    this.needBorderRight = true,
    required this.bgColorMuseOver,
    required this.dividerColor,
    required this.zebraColors,
    required this.rowSelectColor,
    this.mouseCursor = SystemMouseCursors.click,
    this.pinColumnHeader = true,
    this.pinColumnCount = 0,
    this.headerHeight = 40,
    this.rowHeight = 40,
    this.supportLoadMore = true,
    this.lastRowHeight = 0,
    this.tableRowContainer,
  });

  TableConfig copyWith({
    int? rowCount,
    List<TableColumnConfig>? columnConfigs,
    double? lastRowHeight,
    Widget Function(int, ATableRow)? tableRowContainer,
  }) {
    return TableConfig(
      columnConfigs: columnConfigs ?? this.columnConfigs,
      rowCount: rowCount ?? this.rowCount,
      fixedWidth: fixedWidth,
      loadMoreTriggerExtent: loadMoreTriggerExtent,
      needBorderTop: needBorderTop,
      needBorderLeft: needBorderLeft,
      needBorderRight: needBorderRight,
      bgColorMuseOver: bgColorMuseOver,
      dividerColor: dividerColor,
      zebraColors: zebraColors,
      rowSelectColor: rowSelectColor,
      mouseCursor: mouseCursor,
      pinColumnHeader: pinColumnHeader,
      pinColumnCount: pinColumnCount,
      headerHeight: headerHeight,
      rowHeight: rowHeight,
      supportLoadMore: supportLoadMore,
      lastRowHeight: lastRowHeight ?? this.lastRowHeight,
      tableRowContainer: tableRowContainer ?? this.tableRowContainer,
    );
  }
}
