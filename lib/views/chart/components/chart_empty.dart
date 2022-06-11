import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/utils/widgets/google_text.dart';

class ChartEmpty extends StatelessWidget {
  const ChartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier! * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier! * 25,
            child: SvgPicture.asset('assets/svg/empty_chart.svg'),
          ),
          SizedBox(height: SizeConfig.heightMultiplier! * 5),
          SizedBox(
            width: SizeConfig.widthMultiplier! * 50,
            child: GoogleText(
              maxLine: 2,
              textAlign: TextAlign.center,
              text: "Keranjang masih kosong!",
              fontSize: SizeConfig.textMultiplier! * 3.5,
              color: kPrimaryTextColor,
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier! * 3),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kSecondaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: GoogleText(
              text: "Kembali ke Home",
              color: kWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
