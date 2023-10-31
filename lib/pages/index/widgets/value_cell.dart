import 'package:arb_manager/arb/arb_item.dart';
import 'package:flutter/material.dart';

class ValueCell extends StatelessWidget {
  final ArbItem item;
  const ValueCell({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(child: Text(item.value));
  }
}
