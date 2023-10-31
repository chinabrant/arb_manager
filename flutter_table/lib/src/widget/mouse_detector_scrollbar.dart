import 'package:flutter/material.dart';

import 'mouse_region_builder.dart';

/// 鼠标进入显示滑动条
class TableMouseDetectorScrollBar extends StatelessWidget {
  final Widget child;

  /// 必须和Scollable控件提供相同的controller
  final ScrollController controller;
  final ScrollbarOrientation? scrollbarOrientation;

  const TableMouseDetectorScrollBar({
    Key? key,
    required this.child,
    required this.controller,
    this.scrollbarOrientation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableMouseRegionBuilder(
        mouseCursor: MouseCursor.defer,
        builder: (context, isEnter) {
          return Scrollbar(
              controller: controller,
              thickness: 4,
              // scrollbarOrientation: scrollbarOrientation,
              thumbVisibility: isEnter ? true : false,
              child: child);
        });
  }
}
