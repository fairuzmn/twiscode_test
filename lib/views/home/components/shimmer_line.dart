import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twistcode/utils/size_config.dart';

class ShimmerLine extends StatelessWidget {
  const ShimmerLine({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: height ?? SizeConfig.heightMultiplier! * 1.5,
        width: width ?? SizeConfig.widthMultiplier! * 60,
        color: Colors.white,
      ),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
    );
  }
}
