import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/size_config.dart';

class GoogleText extends StatefulWidget {
  const GoogleText({Key? key, this.fontSize, required this.text, this.maxLine = 1, this.color = kBlackColor, this.textAlign = TextAlign.start}) : super(key: key);
  final double? fontSize;
  final String text;
  final int maxLine;
  final Color color;
  final TextAlign textAlign;

  @override
  _GoogleTextState createState() => _GoogleTextState();
}

class _GoogleTextState extends State<GoogleText> {
  @override
  Widget build(BuildContext context) {
    double _fontSize = widget.fontSize ?? SizeConfig.textMultiplier! * 1.8;
    return Text(
      widget.text,
      overflow: TextOverflow.ellipsis,
      maxLines: widget.maxLine,
      style: GoogleFonts.inter(fontSize: _fontSize, fontWeight: FontWeight.w700, color: widget.color),
      textAlign: widget.textAlign,
    );
  }
}
