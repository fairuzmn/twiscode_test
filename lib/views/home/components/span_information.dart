import 'package:flutter/material.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/size_config.dart';

class SpanInformation extends StatelessWidget {
  const SpanInformation({Key? key, required this.text, required this.bgColor, this.textColor = kWhiteColor}) : super(key: key);

  final String text;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier! * 1),
        child: GoogleText(
          text: text,
          color: textColor,
          fontSize: SizeConfig.textMultiplier! * 1.4,
        ),
      ),
    );
  }
}
