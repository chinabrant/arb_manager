import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_table/a_table.dart';

import 'table_row.dart';

class FillBlankTable extends StatefulWidget {
  final TableConfig config;
  final TableController? tableController;

  const FillBlankTable({
    Key? key,
    required this.config,
    this.tableController,
  }) : super(key: key);

  @override
  State<FillBlankTable> createState() => _FillBlankTableState();
}

class _FillBlankTableState extends State<FillBlankTable> {
  TableConfig get config => widget.config;

  TableController? get tableController => widget.tableController;

  /// 记录表格的最大宽度
  double _maxWidth = 0;

  /// 记录表格的最大高度
  double _maxHeight = 0;

  /// 最终展示的行数
  int showRowsCount = 0;

  /// 当需要使用空白表格进行填充时，最后一行的高度。
  double lastRowHeightOnFill = 0;

  /// 最终展示的列的属性集合
  List<TableColumnConfig> showColumnConfigs = [];

  /// 最终传递给基础表格的配置
  late TableConfig fillTableConfig;

  @override
  void initState() {
    super.initState();
    fillTableConfig = config;
    showRowsCount = config.rowCount;
    showColumnConfigs = config.columnConfigs;
  }

  @override
  void didUpdateWidget(covariant FillBlankTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    onConfigChange(oldWidget.config);
  }

  /// 重新设置表格配置
  void _resetTableConfig() {
    if (showRowsCount > config.rowCount) {
      showColumnConfigs = showColumnConfigs
          .map((e) => e.copyWith((row) {
                if (row >= config.rowCount) return Container();
                return e.widgetForCell.call(row);
              }))
          .toList();
    }
    Widget Function(int, ATableRow)? tableRowContainer;
    if (config.tableRowContainer != null) {
      tableRowContainer = (rowIndex, tableRow) {
        if (rowIndex >= config.rowCount) return tableRow;
        return config.tableRowContainer!.call(rowIndex, tableRow);
      };
    }
    fillTableConfig = config.copyWith(
      rowCount: showRowsCount,
      columnConfigs: showColumnConfigs,
      lastRowHeight: lastRowHeightOnFill,
      tableRowContainer: tableRowContainer,
    );
  }

  ///计算表格对应的行数，列数
  ///首次会计算，后续只有尺寸变化后才会重新做列和行的计算
  void calculateTable(double maxWidth, double maxHeight) {
    bool hasChange = false;
    //宽度没有变化，不需要重新计算列数
    if (maxWidth != _maxWidth) {
      _maxWidth = maxWidth;
      _calculateShowColumns(maxWidth);
      hasChange = true;
    }
    //高度没有变化，则不需要重新计算行数
    if (maxHeight != _maxHeight) {
      _maxHeight = maxHeight;
      _calculateShowRows(maxHeight);
      hasChange = true;
    }
    if (hasChange) {
      _resetTableConfig();
    }
  }

  /// 响应配置变化
  void onConfigChange(TableConfig oldConfig) {
    bool hasChange = false;
    //数据量变了，需要重新计算行数
    if (oldConfig.rowCount != config.rowCount && _maxHeight != 0) {
      hasChange = true;
      _calculateShowRows(_maxHeight);
    }
    //属性调整了，需要重新计算列数
    if (!listEquals(oldConfig.columnConfigs, config.columnConfigs) &&
        _maxWidth != 0) {
      hasChange = true;
      if (config.fixedWidth != null) {
        //如果是固定宽度，只更新 columns 不去计算填充
        showColumnConfigs = config.columnConfigs;
      } else {
        _calculateShowColumns(_maxWidth);
      }
    }
    if (hasChange) {
      _resetTableConfig();
    }
  }

  ///计算展示的表格行数
  void _calculateShowRows(double maxHeight) {
    //计算真实数据表格的高度：表格内容高度 + 分割线高度 * 数据量  +  表格头高度 + 分割线高度
    final realHeight =
        (config.rowHeight + 1) * config.rowCount + config.headerHeight + 1;
    if (maxHeight > realHeight) {
      //需要填充数据，计算填充后的行数：最大高度 - (表头高度 + 分割线高度)  除去 （表格高度 + 分割线）取整。
      showRowsCount =
          (maxHeight - (config.headerHeight + 1)) ~/ (config.rowHeight + 1);
      lastRowHeightOnFill =
          (maxHeight - (config.headerHeight + 1)) % (config.rowHeight + 1);
      lastRowHeightOnFill = lastRowHeightOnFill - 1;
      if (lastRowHeightOnFill > 0) {
        showRowsCount++;
      }
    } else {
      showRowsCount = config.rowCount;
      lastRowHeightOnFill = 0;
    }
  }

  ///计算展示的表格列数
  void _calculateShowColumns(double maxWidth) {
    //如果表格是固定宽度，那么表格的列属性集合就不需要填充空白列了。
    if (config.fixedWidth != null) {
      return;
    }
    //计算真实数据的宽度：集合内（表格内容的宽度 + 分割线宽度）相加
    final realWidth =
        config.columnConfigs.map((e) => e.widthOrFlex + 1).toList().sum;
    //后续默认的宽度都为 88
    if (maxWidth > realWidth + 88) {
      showColumnConfigs = [...config.columnConfigs];
      final addColumnCount = (maxWidth - realWidth) ~/ 88;
      //添加空白列，填充表格
      for (int i = 0; i < addColumnCount; i++) {
        showColumnConfigs.add(TableColumnConfig(
          widthOrFlex: 88,
          widgetForHeader: () => Container(),
          widgetForCell: (int row) => Container(),
        ));
      }
    } else {
      showColumnConfigs = config.columnConfigs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      calculateTable(constraints.maxWidth, constraints.maxHeight);
      return ATable(
        config: fillTableConfig,
        tableController: tableController,
      );
    });
  }
}
