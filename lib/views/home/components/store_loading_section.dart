import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/views/home/components/shimmer_line.dart';

class StoreLoadingSection extends StatelessWidget {
  const StoreLoadingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(SizeConfig.heightMultiplier! * .5),
      child: Card(
        elevation: 2,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: Container(
                height: SizeConfig.heightMultiplier! * 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 3, vertical: SizeConfig.heightMultiplier! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLine(width: SizeConfig.widthMultiplier! * 60),
                  SizedBox(height: SizeConfig.widthMultiplier! * 2),
                  ShimmerLine(width: SizeConfig.widthMultiplier! * 20),
                  SizedBox(height: SizeConfig.widthMultiplier! * 2),
                  ShimmerLine(width: SizeConfig.widthMultiplier! * 30),
                  SizedBox(height: SizeConfig.widthMultiplier! * 2),
                  ShimmerLine(width: SizeConfig.widthMultiplier! * 28),
                  SizedBox(height: SizeConfig.widthMultiplier! * 2),
                  Row(
                    children: [
                      ShimmerLine(width: SizeConfig.widthMultiplier! * 10),
                      SizedBox(width: SizeConfig.widthMultiplier! * 2),
                      ShimmerLine(width: SizeConfig.widthMultiplier! * 10),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
