import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

typedef SearchSubmit = void Function(String keyword);

/// 搜索框
class CustomTextField extends StatefulWidget {
  final String text;
  final SearchSubmit? onSubmit;
  final TextEditingController controller;
  final double height;
  final String placeholder;
  final int maxLines;
  const CustomTextField({
    Key? key,
    this.text = "",
    this.height = 30,
    this.placeholder = '',
    required this.controller,
    this.onSubmit,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.only(left: 10),
        height: widget.height,
        // width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 0.5,
              color: AppTheme.color(context).secondaryText,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                scrollPadding: EdgeInsets.zero,
                maxLines: widget.maxLines,
                minLines: 1,
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.color(context).primaryText,
                ),
                strutStyle: const StrutStyle(height: 1, forceStrutHeight: true),
                textAlign: TextAlign.start,
                textAlignVertical: widget.maxLines > 1
                    ? TextAlignVertical.top
                    : TextAlignVertical.center,
                textInputAction: TextInputAction.search,
                onSubmitted: ((value) {
                  // print('onSubmitted');
                  widget.onSubmit?.call(widget.controller?.text ?? "");
                  _focusNode.unfocus();
                }),
                onEditingComplete: (() {
                  // print('onEditingComplete');
                }),
                decoration: InputDecoration(
                    // isCollapsed: true,
                    hintText: widget.placeholder,
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: AppTheme.color(context).remarksText,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    focusedBorder: border,
                    disabledBorder: border,
                    enabledBorder: border,
                    border: border),
                controller: widget.controller,
              ),
            ),
          ],
        ));
  }

  OutlineInputBorder get border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 0.5,
        color: Colors.transparent, // AppTheme.color(context).secondaryText,
      ));
}
