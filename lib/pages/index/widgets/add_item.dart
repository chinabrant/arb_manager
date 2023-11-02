import 'package:arb_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({Key? key}) : super(key: key);

  static Future show(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AddItemDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 500,
        height: 400,
        child: Column(
          children: [
            _Item(title: 'key'),
            _Item(title: 'en'),
            _Item(title: 'zh'),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  const _Item({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          child: Text(title),
        ),
        CustomTextField(controller: TextEditingController())
      ],
    );
  }
}
