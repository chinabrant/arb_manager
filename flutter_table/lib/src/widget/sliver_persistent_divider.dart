import 'package:flutter/material.dart';

/// sliver分隔线
class SliverPersistentDivider extends SliverPersistentHeader {
  SliverPersistentDivider({
    Key? key,
    bool isVertical = true,
    bool pinned = false,
    bool floating = false,
    double extent = 1,
    Color color = Colors.black,

    ///分割线的长度
    double length = double.infinity,
  }) : super(
            key: key,
            pinned: pinned,
            floating: floating,
            delegate: SliverPersistentDividerDelegate(
              color: color,
              extent: extent,
              isVertical: isVertical,
              length: length,
            ));
}

class SliverPersistentDividerDelegate extends SliverPersistentHeaderDelegate {
  final double extent;
  final bool isVertical;
  final Color color;
  final double length;

  SliverPersistentDividerDelegate({
    this.extent = 1,
    this.isVertical = true,
    this.color = Colors.black,
    this.length = double.infinity,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (isVertical) {
      return Container(
        height: extent,
        color: color,
      );
    } else {
      return Container(
        width: extent,
        color: color,
      );
    }
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  bool shouldRebuild(covariant SliverPersistentDividerDelegate oldDelegate) {
    return true;
  }
}
