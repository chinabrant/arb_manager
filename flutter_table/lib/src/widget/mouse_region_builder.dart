import 'package:flutter/material.dart';

class TableMouseRegionBuilder extends StatefulWidget {
  /// 第二个参数，鼠标是否进入
  final Widget Function(BuildContext, bool) builder;
  final MouseCursor mouseCursor;

  const TableMouseRegionBuilder({
    Key? key,
    required this.builder,
    this.mouseCursor = SystemMouseCursors.click,
  }) : super(key: key);

  @override
  State<TableMouseRegionBuilder> createState() => _MouseRegionBuilderState();
}

class _MouseRegionBuilderState extends State<TableMouseRegionBuilder> {
  bool _isMouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isMouseOver = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isMouseOver = false;
        });
      },
      cursor: widget.mouseCursor,
      child: widget.builder(context, _isMouseOver),
    );
  }
}
