import 'package:arb_manager/arb/manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arbManager = context.read<ArbManager>();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Center(
            child: Text('Arb Manager'),
          ),
        ),
      ],
    );
  }
}
