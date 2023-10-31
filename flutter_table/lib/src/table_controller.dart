import 'package:flutter_table/a_table.dart';

mixin TableController on TableRowManager {
  /// 记录选中行
  int _selectIndex = -1;

  int get selectIndex => _selectIndex;

  /// 加载更多回调
  void loadMore();

  /// 清空选中行
  void clearSelect() {
    getTableRowSelect(selectIndex)?.updateSelectRow(-1);
    _selectIndex = -1;
  }

  /// 更新选中行
  void updateSelectIndex(int rowIndex) {
    if (rowIndex == selectIndex) {
      return;
    }
    //更新之前选中行的状态
    getTableRowSelect(selectIndex)?.updateSelectRow(rowIndex);
    _selectIndex = rowIndex;
    //更新最新选中行的状态
    getTableRowSelect(selectIndex)?.updateSelectRow(rowIndex);
  }
}
