import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/utils/widgets/google_text.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({Key? key, required this.onRetry}) : super(key: key);

  final Function onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier! * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier! * 25,
            child: SvgPicture.asset('assets/svg/host_unreachable.svg'),
          ),
          SizedBox(height: SizeConfig.heightMultiplier! * 5),
          SizedBox(
            width: SizeConfig.widthMultiplier! * 70,
            child: GoogleText(
              maxLine: 5,
              textAlign: TextAlign.center,
              text: "Kesalahan dalam menghubungi server",
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
            onPressed: () => onRetry(),
            child: GoogleText(
              text: "Coba Lagi",
              color: kWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
