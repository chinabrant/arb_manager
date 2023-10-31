import 'package:flutter/widgets.dart';
import 'package:flutter_table/src/table_cell_config.dart';

class ATableCell extends StatefulWidget {
  final Widget child;
  final TableCellConfig config;

  const ATableCell({
    Key? key,
    required this.child,
    required this.config,
  }) : super(key: key);

  @override
  State<ATableCell> createState() => _ATableCellState();
}

class _ATableCellState extends State<ATableCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: widget.config.color,
      child: widget.child,
    );
  }
}
