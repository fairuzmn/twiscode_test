import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/views/chart/chart_screen.dart';

class StoreHeader extends StatelessWidget {
  const StoreHeader({Key? key, required this.counter, required this.needRefresh}) : super(key: key);

  final int counter;
  final Function needRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 3, vertical: SizeConfig.heightMultiplier! * 2.5),
      child: Row(
        children: [
          GoogleText(
            text: 'Twiscode Test',
            fontSize: SizeConfig.textMultiplier! * 3,
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (context) => ChartScreen()));
              needRefresh();
            },
            child: Badge(
              child: Icon(Icons.shopping_cart),
              // badgeContent: GoogleText(
              //   text: counter.toString(),
              //   color: kWhiteColor,
              // ),
              badgeContent: Text(counter.toString(), style: TextStyle(color: kWhiteColor)),
              badgeColor: kSecondaryTextColor,
              showBadge: counter > 0,
              animationType: BadgeAnimationType.slide,
            ),
          )
        ],
      ),
    );
  }
}
