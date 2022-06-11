import 'package:flutter/material.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/size_config.dart';

class IconInformation extends StatelessWidget {
  const IconInformation({Key? key, required this.text, required this.icon}) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: SizeConfig.textMultiplier! * 1.8, color: kThirdTextColor),
        SizedBox(width: SizeConfig.widthMultiplier! * 1),
        Expanded(
          child: GoogleText(
            text: text == "" ? "-" : text,
            color: kThirdTextColor,
          ),
        )
      ],
    );
  }
}
