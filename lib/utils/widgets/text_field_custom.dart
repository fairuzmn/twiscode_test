import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/size_config.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.numberInput = false,
    this.callback,
    this.rightLabel,
    this.useRightLabel = false,
    this.focusNode,
    this.useFocusNode = false,
    this.onChange,
    this.isMultiLine = false,
    this.fontSize,
    this.labelColor = kBlackColor,
  }) : super(key: key);

  final String label;
  final Color labelColor;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final bool numberInput;
  final Function? callback;
  final Widget? rightLabel;
  final bool useRightLabel;
  final FocusNode? focusNode;
  final bool useFocusNode;
  final Function? onChange;
  final bool isMultiLine;
  final double? fontSize;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: TextStyle(color: widget.labelColor, fontWeight: FontWeight.w700, fontSize: widget.fontSize ?? SizeConfig.textMultiplier! * 1.8),
            ),
            widget.useRightLabel ? widget.rightLabel! : Container(),
          ],
        ),
        SizedBox(height: SizeConfig.heightMultiplier! * 1.5),
        TextFormField(
          onChanged: (text) {
            if (widget.onChange != null) {
              widget.onChange!(text);
            }
          },
          focusNode: widget.useFocusNode ? widget.focusNode! : _focusNode,
          onTap: () {
            if (widget.callback != null) {
              widget.callback!();
            }
          },
          inputFormatters: widget.numberInput ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] : [],
          keyboardType: widget.numberInput ? TextInputType.number : (widget.isMultiLine ? TextInputType.multiline : TextInputType.text),
          readOnly: widget.readOnly,
          controller: widget.controller,
          style: TextStyle(color: kGreyColor, fontWeight: FontWeight.w700, fontSize: widget.fontSize ?? SizeConfig.textMultiplier! * 1.8),
          decoration: InputDecoration(
            focusColor: kPrimaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: kGreyColor, fontWeight: FontWeight.w700, fontSize: widget.fontSize ?? SizeConfig.textMultiplier! * 1.8),
            fillColor: kWhiteColor,
          ),
          minLines: widget.isMultiLine ? 4 : 1,
          maxLines: widget.isMultiLine ? 4 : 1,
        ),
        SizedBox(height: SizeConfig.heightMultiplier! * 2),
      ],
    );
  }
}
