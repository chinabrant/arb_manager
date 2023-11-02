import 'package:arb_manager/arb/arb_file.dart';
import 'package:arb_manager/arb/manager.dart';
import 'package:arb_manager/pages/index/widgets/add_item.dart';
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
              children: [
                TextButton(
                    onPressed: () {
                      AddItemDialog.show(context);
                    },
                    child: Text('添加')),
              ],
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

    if (values.isEmpty) {
      return const SizedBox.shrink();
    }

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
}
