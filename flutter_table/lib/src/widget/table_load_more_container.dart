import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'mouse_detector_scrollbar.dart';

class TableLoadMoreContainer extends StatefulWidget {
  final double loadMoreExtent;
  final VoidCallback onLoadMore;
  final ScrollView Function(ScrollController) builder;

  const TableLoadMoreContainer({
    Key? key,
    required this.loadMoreExtent,
    required this.onLoadMore,
    required this.builder,
  }) : super(key: key);

  @override
  State<TableLoadMoreContainer> createState() => _TableLoadMoreContainerState();
}

class _TableLoadMoreContainerState extends State<TableLoadMoreContainer> {
  final scrollController = ScrollController();

  ///用于加载更多的回调节流，避免频繁调用
  BehaviorSubject loadMoreStream = BehaviorSubject();

  ///记录上次的位置，用来判断当前滑动是往上还是往下
  double lastExtent = 0;

  @override
  void initState() {
    super.initState();
    loadMoreStream
        .throttleTime(const Duration(milliseconds: 500))
        .listen((event) {
      // 开始加载更多
      widget.onLoadMore.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableMouseDetectorScrollBar(
      controller: scrollController,
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is! ScrollNotification) {
            // 如果不是滚动事件，直接返回
            return false;
          }
          ScrollNotification scroll = notification;
          // 当前滑动距离
          double currentExtent = scroll.metrics.pixels;
          double maxExtent = scroll.metrics.maxScrollExtent;

          // 是否向下滑动
          bool isScrollDown =
              scroll.metrics.axisDirection == AxisDirection.down &&
                  currentExtent > lastExtent;
          if (maxExtent - currentExtent < widget.loadMoreExtent &&
              isScrollDown) {
            loadMoreStream.add(null);
          }
          lastExtent = currentExtent;
          // 返回false，继续向上传递,返回true则不再向上传递
          return false;
        },
        child: widget.builder(scrollController),
      ),
    );
  }
}
