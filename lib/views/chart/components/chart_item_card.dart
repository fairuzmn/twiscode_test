import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:twistcode/models/Item.dart';
import 'package:twistcode/models/chart_item.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/helpers.dart';
import 'package:twistcode/utils/size_config.dart';

class ChartItemCard extends StatelessWidget {
  const ChartItemCard({Key? key, required this.item, required this.chartItem, required this.changeQty}) : super(key: key);

  final ItemModel item;
  final ChartItemModel chartItem;
  final Function changeQty;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier! * 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier! * 4),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(right: SizeConfig.widthMultiplier! * 2.5),
                width: SizeConfig.widthMultiplier! * 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const CircularProgressIndicator(color: kPrimaryColor),
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: SizeConfig.widthMultiplier! * 65,
                      child: GoogleText(
                        text: item.name,
                        color: kPrimaryTextColor,
                        fontSize: SizeConfig.textMultiplier! * 2.2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier! * .5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GoogleText(
                            text: Helpers.formatCurrency(nominal: item.price),
                            color: kSecondaryTextColor,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  changeQty(item.id, false);
                                },
                                child: Container(
                                  width: SizeConfig.widthMultiplier! * 5,
                                  height: SizeConfig.widthMultiplier! * 5,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: kRedColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: SizeConfig.textMultiplier! * 1.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 2),
                                child: GoogleText(text: chartItem.qty.toString()),
                              ),
                              InkWell(
                                onTap: () {
                                  changeQty(item.id, true);
                                },
                                child: Container(
                                  width: SizeConfig.widthMultiplier! * 5,
                                  height: SizeConfig.widthMultiplier! * 5,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: SizeConfig.textMultiplier! * 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GoogleText(
                          text: item.itemCondition != '' ? '(${item.itemCondition})' : '',
                          color: kThirdTextColor,
                        ),
                        GoogleText(text: '${Helpers.formatCurrency(nominal: item.weight * chartItem.qty, symbol: '')} KG'),
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
