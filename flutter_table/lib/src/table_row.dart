import 'package:flutter/widgets.dart';
import 'package:flutter_table/a_table.dart';
import 'package:flutter_table/src/table_cell.dart';
import 'package:flutter_table/src/table_cell_config.dart';
import 'package:flutter_table/src/table_row_config.dart';

import 'controller/table_row_controller.dart';
import 'widget/mouse_region_builder.dart';
import 'widget/sliver_persistent_divider.dart';

class ATableRow extends StatefulWidget {
  final TableRowConfig rowConfig;
  final List<TableColumnConfig> columnConfigs;
  final int rowIndex;
  final TableRowManager? rowManager;

  const ATableRow({
    Key? key,
    required this.rowConfig,
    required this.columnConfigs,
    required this.rowIndex,
    this.rowManager,
  }) : super(key: key);

  @override
  State<ATableRow> createState() => _ATableRowState();
}

class _ATableRowState extends State<ATableRow> with RowController {
  @override
  TableRowConfig get rowConfig => widget.rowConfig;

  @override
  TableRowManager? get rowManager => widget.rowManager;

  @override
  int get rowIndex => widget.rowIndex;

  ///当前是否为选中行
  bool isRowSelect = false;

  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = rowConfig.scrollControllerGroup.addAndGet();
  }

  @override
  void updateSelectRow(int selectRow) {
    if (rowConfig.isHeader) return;
    setState(() {
      isRowSelect = selectRow == rowIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableMouseRegionBuilder(
      mouseCursor: rowConfig.mouseCursor,
      builder: (context, isMouseOver) {
        Color? firstBgColor;
        //表头不支持选中，滑动色
        if (!rowConfig.isHeader) {
          //底色优先级：选中色 > 滑动色 > 底色
          firstBgColor = isRowSelect
              ? rowConfig.bgSelectColor
              : isMouseOver
                  ? rowConfig.bgColorMuseOver
                  : null;
        }
        return Container(
            height: rowConfig.rowHeight,
            width: rowConfig.rowWidth ?? double.infinity,
            color: firstBgColor ?? rowConfig.bgColor,
            child: rowConfig.rowWidth == null
                ? CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    slivers: rowConfig.createUnFixedRowChildren(
                      rowIndex: rowIndex,
                      columnConfigs: widget.columnConfigs,
                      firstBgColor: firstBgColor,
                    ),
                  )
                : Row(
                    children: rowConfig.createFixedRowChildren(
                      rowIndex: rowIndex,
                      columnConfigs: widget.columnConfigs,
                      firstBgColor: firstBgColor,
                    ),
                  ));
      },
    );
  }
}

extension _TableRowConfigExt on TableRowConfig {
  /// 创建固定行中的子 view 集合
  List<Widget> createFixedRowChildren({
    required int rowIndex,
    required List<TableColumnConfig> columnConfigs,
    Color? firstBgColor,
  }) {
    final List<Widget> children = [];
    if (needBorderLeft) children.add(Container(width: 1, color: dividerColor));
    for (int i = 0; i < columnConfigs.length; i++) {
      final columnConfig = columnConfigs[i];
      Color? columnBgColor = firstBgColor;
      if (columnBgColor == null && !isHeader && columnConfig.bgColors != null) {
        columnBgColor =
            columnConfig.bgColors![rowIndex % columnConfig.bgColors!.length];
      }
      final cellWidget = TableCellConfig(color: columnBgColor).createCell(
        columnConfig.createWidget(isHeader: isHeader, rowIndex: rowIndex),
      );

      if (columnConfig.useFlex) {
        children.add(
          Expanded(flex: columnConfig.widthOrFlex.toInt(), child: cellWidget),
        );
      } else {
        children.add(
          SizedBox(width: columnConfig.widthOrFlex, child: cellWidget),
        );
      }
      if (i < columnConfigs.length - 1 || needBorderRight) {
        children.add(Container(width: 1, color: dividerColor));
      }
    }
    return children;
  }

  /// 创建非固宽行的子 view 集合
  List<Widget> createUnFixedRowChildren({
    required int rowIndex,
    required List<TableColumnConfig> columnConfigs,
    Color? firstBgColor,
  }) {
    final List<Widget> children = [];
    if (needBorderLeft) {
      children.add(SliverPersistentDivider(
          pinned: true, isVertical: false, color: dividerColor));
    }
    for (int i = 0; i < columnConfigs.length; i++) {
      final columnConfig = columnConfigs[i];
      Color? columnBgColor = firstBgColor;
      if (columnBgColor == null && !isHeader && columnConfig.bgColors != null) {
        columnBgColor =
            columnConfig.bgColors![rowIndex % columnConfig.bgColors!.length];
      }
      final cellWidget = TableCellConfig(color: columnBgColor).createCell(
        columnConfig.createWidget(isHeader: isHeader, rowIndex: rowIndex),
      );

      final pinned = needPin(i);

      children.add(SliverPersistentHeader(
        pinned: pinned,
        delegate: RowItemDelegate(
          width: columnConfig.widthOrFlex,
          child: cellWidget,
          pinned: pinned,
          color: (firstBgColor ?? bgColor).withOpacity(1),
        ),
      ));

      if (i < columnConfigs.length - 1 || needBorderRight) {
        children.add(SliverPersistentDivider(
            pinned: pinned, isVertical: false, color: dividerColor));
      }
    }
    return children;
  }

  bool needPin(int col) => pinCount > col;
}

extension _TableCellConfigExt on TableCellConfig {
  Widget createCell(Widget child) {
    return ATableCell(
      config: this,
      child: child,
    );
  }
}

extension _TableColumnConfigExt on TableColumnConfig {
  Widget createWidget({
    bool isHeader = false,
    required int rowIndex,
  }) {
    if (isHeader) return widgetForHeader.call();
    return widgetForCell.call(rowIndex);
  }
}

class RowItemDelegate extends SliverPersistentHeaderDelegate {
  final double width;
  final Widget child;
  final bool pinned;
  final Color? color;

  RowItemDelegate({
    required this.child,
    required this.width,
    this.pinned = false,
    this.color,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (!pinned) return child;
    return Container(
      color: color,
      child: child,
    );
  }

  @override
  double get maxExtent => width;

  @override
  double get minExtent => width;

  @override
  bool shouldRebuild(covariant RowItemDelegate oldDelegate) {
    return true;
  }
}
