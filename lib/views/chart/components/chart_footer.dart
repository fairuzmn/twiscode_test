import 'package:flutter/material.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/helpers.dart';
import 'package:twistcode/utils/size_config.dart';

class ChartFooter extends StatelessWidget {
  const ChartFooter({Key? key, required this.totalChart}) : super(key: key);

  final num totalChart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthMultiplier! * 100,
      child: Card(
        elevation: 15,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 10, vertical: SizeConfig.heightMultiplier! * 2.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GoogleText(
                    text: 'Total Harga',
                    fontSize: SizeConfig.textMultiplier! * 2.2,
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier! * 1),
                  GoogleText(
                    text: Helpers.formatCurrency(nominal: totalChart),
                    fontSize: SizeConfig.textMultiplier! * 2.2,
                    color: kSecondaryTextColor,
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                height: SizeConfig.widthMultiplier! * 12,
                width: SizeConfig.widthMultiplier! * 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kSecondaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: GoogleText(
                    text: "Order",
                    color: kWhiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
