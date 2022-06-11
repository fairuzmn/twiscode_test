import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twistcode/models/Item.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/helpers.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/views/home/components/icon_information.dart';
import 'package:twistcode/views/home/components/span_information.dart';

class StoreItem extends StatelessWidget {
  const StoreItem({Key? key, required this.itemModel, required this.onClick}) : super(key: key);

  final ItemModel itemModel;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(itemModel);
      },
      child: Container(
        margin: EdgeInsets.all(SizeConfig.heightMultiplier! * .5),
        child: Card(
          elevation: 2,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                placeholder: (context, url) => Shimmer.fromColors(
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
                imageUrl: itemModel.imageUrl,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 3, vertical: SizeConfig.heightMultiplier! * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoogleText(
                      text: itemModel.name,
                      maxLine: 2,
                      fontSize: SizeConfig.textMultiplier! * 2.1,
                      color: kPrimaryTextColor,
                    ),
                    SizedBox(height: SizeConfig.widthMultiplier! * 2),
                    GoogleText(
                      text: Helpers.formatCurrency(nominal: itemModel.price),
                      color: kSecondaryTextColor,
                      fontSize: SizeConfig.textMultiplier! * 2,
                    ),
                    SizedBox(height: SizeConfig.widthMultiplier! * 2),
                    IconInformation(text: itemModel.location, icon: Icons.place),
                    SizedBox(height: SizeConfig.widthMultiplier! * 2),
                    IconInformation(text: itemModel.username, icon: Icons.person),
                    SizedBox(height: SizeConfig.widthMultiplier! * 2),
                    Row(
                      children: [
                        !itemModel.isSoldOut ? SpanInformation(text: 'Ready Stock', bgColor: kPrimaryColor) : SizedBox(),
                        itemModel.isHalal ? SpanInformation(text: 'Halal', bgColor: kGreenColor) : SizedBox(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
