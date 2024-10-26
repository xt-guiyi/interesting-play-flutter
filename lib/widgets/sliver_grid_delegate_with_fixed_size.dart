import 'package:flutter/rendering.dart';

class SliverGridDelegateWithFixedSize extends SliverGridDelegate {
  /// 宽
  final double width;

  /// 高
  final double height;

  /// 纵轴间距
  final double mainAxisSpacing;

  /// 横轴间距
  final double crossAxisSpacing;

  SliverGridDelegateWithFixedSize(this.width, this.height,
      {this.mainAxisSpacing = 0.0, this.crossAxisSpacing = 0.0});

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final crossAxisCount = constraints.crossAxisExtent ~/ width;
    final double crossAxisSpacing;
    if (this.crossAxisSpacing == 0.0) {
      crossAxisSpacing =
          (constraints.crossAxisExtent - width * crossAxisCount) /
              (crossAxisCount - 1);
    } else {
      crossAxisSpacing = this.crossAxisSpacing;
    }

    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: height + mainAxisSpacing,
      crossAxisStride: width + crossAxisSpacing,
      childMainAxisExtent: height,
      childCrossAxisExtent: width,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegateWithFixedSize oldDelegate) {
    return oldDelegate.width != width ||
        oldDelegate.height != height ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing;
  }
}
