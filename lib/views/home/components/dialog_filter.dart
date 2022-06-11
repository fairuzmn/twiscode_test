import 'package:flutter/material.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/widgets/text_field_custom.dart';

class DialogFilter extends StatelessWidget {
  const DialogFilter({Key? key, required this.namaCtrl, required this.MinCtrl, required this.MaxCtrl, required this.dialogContext}) : super(key: key);

  final TextEditingController namaCtrl, MinCtrl, MaxCtrl;
  final BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Column(
        children: [
          GoogleText(
            text: 'Filter Item',
            fontSize: SizeConfig.textMultiplier! * 2,
          ),
          GoogleText(text: '( Dummy Layout )', color: kThirdTextColor, fontSize: SizeConfig.textMultiplier! * 1.5),
          Divider(),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldCustom(label: 'Nama Item', hintText: 'Masukkan nama item', controller: namaCtrl),
          TextFieldCustom(label: 'Harga Minimal', hintText: 'Masukkan harga minimal', controller: MinCtrl, numberInput: true),
          TextFieldCustom(label: 'Harga Maksimal', hintText: 'Masukkan harga maksimal', controller: MaxCtrl, numberInput: true),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kSecondaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: GoogleText(
                text: "Selesai",
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
