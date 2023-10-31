import 'package:arb_manager/arb/arb_file.dart';
import 'package:arb_manager/arb/manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_table/a_table.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arbManager = context.watch<ArbManager>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey,
              )),
            ),
            child: Row(
              children: [
                Expanded(child: Text(arbManager.path)),
                TextButton(
                  onPressed: () async {
                    String? dir = await FilePicker.platform.getDirectoryPath();
                    if (dir == null) {
                      // 取消了选择
                      return;
                    }

                    arbManager.readFromDir(dir);
                  },
                  child: Text('打开'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('新建'),
                )
              ],
            ),
          ),
          Expanded(
            child: _createFlutterTable(context),
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createFlutterTable(BuildContext context) {
    final arbManager = context.read<ArbManager>();
    final values = arbManager.arbs.values.toList();
    values.sort((a, b) => b.items.length - a.items.length);

    final longArbFile = values.first;

    return FillBlankTable(
      config: TableConfig(
        pinColumnCount: 1,
        columnConfigs: [
          TableColumnConfig(
            widthOrFlex: 150,
            widgetForCell: (row) {
              final key = longArbFile.items.values.toList()[row]?.name ?? '';
              return Container(
                // color: Colors.white,
                child: Text(key),
              );
            },
            widgetForHeader: () {
              return Text('字段');
            },
          ),
          ...values
              .map(
                (arbFile) => TableColumnConfig(
                  widthOrFlex: 250,
                  widgetForCell: (row) {
                    final key =
                        longArbFile.items.values.toList()[row]?.name ?? '';
                    return Text(arbFile.items[key]?.value ?? '');
                  },
                  widgetForHeader: () {
                    return Text(arbFile.locale);
                  },
                ),
              )
              .toList()
        ],
        bgColorMuseOver: Colors.deepPurple,
        rowCount: longArbFile.items.length,
        dividerColor: Colors.grey,
        zebraColors: [Colors.white, Colors.yellow],
        rowSelectColor: Colors.yellow,
      ),
    );
  }

  Widget _createOfficialTable(BuildContext context) {
    final arbManager = context.read<ArbManager>();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          columnWidths: const {
            0: FixedColumnWidth(250),
            1: FixedColumnWidth(250),
            2: FixedColumnWidth(250),
            3: FixedColumnWidth(250),
          },
          border: const TableBorder(
            verticalInside: BorderSide(color: Colors.grey),
            horizontalInside: BorderSide(color: Colors.grey),
          ),
          children: getTableRows(context, arbManager.arbs),
        ),
      ),
    );
  }

  List<TableRow> getTableRows(
      BuildContext context, Map<String, ArbFile> files) {
    final keys = files.keys;
    final values = files.values.toList();
    values.sort((a, b) => b.items.length - a.items.length);

    final longArbFile = values.first;

    // countList.sort((a, b) => a - b);
    // final rowCount = countList.last;

    List<TableRow> rows = [];

    // 表头
    final keyHeader = TableCell(child: Text('字段'));
    final headerCells = values
        .map((e) => TableCell(
                child: Container(
              child: Text(e.locale),
            )))
        .toList();
    TableRow header = TableRow(children: [keyHeader, ...headerCells]);
    rows.add(header);

    // 表格内容 row
    for (int i = 0; i < longArbFile.items.length; i++) {
      final key = longArbFile.items.keys.toList()[i];
      // 第一列的key
      final keyCell = TableCell(child: Text(key));
      final valueCells = values
          .map((e) => e.items[key]?.value ?? '')
          .map((e) => TableCell(child: Text(e)))
          .toList();
      TableRow row = TableRow(children: [keyCell, ...valueCells]);
      rows.add(row);
    }
    // final files[key].items.length;
    return rows;
  }
}
