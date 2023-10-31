import 'table_row_controller.dart';

///状态控制，支持更新指定行
mixin TableRowManager {
  final Map<int, RowController> _rowStateMap = {};

  Map<int, RowController> get rowStateMap => _rowStateMap;

  RowController? getTableRowSelect(int rowIndex) {
    return _rowStateMap[rowIndex];
  }

  void updateRowByIndex(int rowIndex) {
    getTableRowSelect(rowIndex)?.update();
  }

  void bind(int rowIndex, RowController row) {
    _rowStateMap[rowIndex] = row;
  }

  void unBind(int rowIndex, RowController row) {
    if (row == _rowStateMap[rowIndex]) {
      _rowStateMap.remove(rowIndex);
    }
  }
}
