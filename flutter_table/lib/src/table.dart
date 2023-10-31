import 'package:flutter/material.dart';
import 'package:flutter_table/src/table_row.dart';
import 'package:flutter_table/src/table_row_config.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'table_config.dart';
import 'table_controller.dart';
import 'widget/table_load_more_container.dart';

class ATable extends StatefulWidget {
  final TableConfig config;
  final TableController? tableController;

  const ATable({
    Key? key,
    required this.config,
    this.tableController,
  }) : super(key: key);

  @override
  State<ATable> createState() => _ATableState();
}

class _ATableState extends State<ATable> {
  TableConfig get config => widget.config;

  TableController? get tableController => widget.tableController;

  /// 滑动处理
  final LinkedScrollControllerGroup scrollControllerGroup =
      LinkedScrollControllerGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 顶部边界线
        if (config.needBorderTop)
          Container(height: 1, color: config.dividerColor),
        // 表头
        _createRow(isHeader: true),
        Container(height: 1, color: config.dividerColor),
        Expanded(
          child: config.supportLoadMore
              ? TableLoadMoreContainer(
                  onLoadMore: () => tableController?.loadMore(),
                  loadMoreExtent: config.loadMoreTriggerExtent,
                  builder: (scrollController) =>
                      _createContentBody(controller: scrollController),
                )
              : _createContentBody(),
        ),
      ],
    );
  }

  ///创建内容列表
  ListView _createContentBody({ScrollController? controller}) {
    return ListView.separated(
      controller: controller,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return _createRow(rowIndex: index);
      },
      itemCount: config.rowCount,
      separatorBuilder: (BuildContext context, int index) {
        return Container(height: 1, color: config.dividerColor);
      },
    );
  }

  /// 创建行
  /// [isHeader] 是否表头行
  /// [rowIndex] 行数
  Widget _createRow({bool isHeader = false, int rowIndex = 0}) {
    final rowConfig = TableRowConfig(
      isHeader: isHeader,
      bgColor: _getRowColor(isHeader, rowIndex),
      bgColorMuseOver: config.bgColorMuseOver,
      dividerColor: config.dividerColor,
      scrollControllerGroup: scrollControllerGroup,
      pinCount: config.pinColumnCount,
      rowHeight: config.rowHeight,
      rowWidth: config.fixedWidth,
      needBorderLeft: config.needBorderLeft,
      needBorderRight: config.needBorderRight,
      mouseCursor: config.mouseCursor,
      bgSelectColor: config.rowSelectColor,
    );
    ATableRow row = ATableRow(
      rowConfig: rowConfig,
      columnConfigs: config.columnConfigs,
      rowIndex: rowIndex,
      rowManager: widget.tableController,
    );
    Widget child = row;
    if (config.tableRowContainer != null) {
      child = config.tableRowContainer!.call(rowIndex, row);
    }
    return child;
  }

  Color _getRowColor(bool isHeader, int rowIndex) {
    if (config.zebraColors.isEmpty) {
      print("table row color error, please set config zebraColors");
      return Colors.red;
    }
    if (isHeader) return config.zebraColors[config.zebraColors.length - 1];
    return config.zebraColors[rowIndex % config.zebraColors.length];
  }
}
