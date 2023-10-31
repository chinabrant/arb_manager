import 'package:flutter/widgets.dart';
import 'package:flutter_table/a_table.dart';
import 'package:flutter_table/src/table_row_config.dart';

mixin RowController<T extends StatefulWidget> on State<T> {
  TableRowConfig get rowConfig;

  TableRowManager? get rowManager;

  int get rowIndex;

  @override
  void initState() {
    super.initState();
    if (!rowConfig.isHeader) {
      rowManager?.bind(rowIndex, this);
    }
  }

  @override
  void dispose() {
    if (!rowConfig.isHeader) {
      rowManager?.unBind(rowIndex, this);
    }
    super.dispose();
  }

  /// 更新选中行
  void updateSelectRow(int selectRow);

  /// 更新
  void update() {
    setState(() {});
  }
}
