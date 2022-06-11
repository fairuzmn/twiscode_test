import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twistcode/models/category.dart';
import 'package:twistcode/providers/store.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/utils/widgets/google_text.dart';

class DialogCategory extends StatefulWidget {
  const DialogCategory({Key? key, required this.namaCtrl, required this.MinCtrl, required this.MaxCtrl, required this.dialogContext}) : super(key: key);

  final TextEditingController namaCtrl, MinCtrl, MaxCtrl;
  final BuildContext dialogContext;

  @override
  State<DialogCategory> createState() => _DialogCategoryState();
}

class _DialogCategoryState extends State<DialogCategory> {
  final List<String> selectedIds = [];

  void checkCategory(String id) {
    int index = selectedIds.indexWhere((category) => category == id);
    if (index == -1) {
      setState(() => selectedIds.add(id));
    } else {
      setState(() => selectedIds.removeAt(index));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Column(
        children: [
          GoogleText(
            text: 'Filter Category',
            fontSize: SizeConfig.textMultiplier! * 2,
          ),
          GoogleText(text: '( Dummy Layout )', color: kThirdTextColor, fontSize: SizeConfig.textMultiplier! * 1.5),
          Divider(),
        ],
      ),
      content: Consumer<StoreProvider>(
        builder: (BuildContext context, storeProvider, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.heightMultiplier! * 58,
                width: SizeConfig.widthMultiplier! * 80,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: storeProvider.categoryItems.length,
                  itemBuilder: (context, index) {
                    final CategoryModel category = storeProvider.categoryItems[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: kSecondaryTextColor,
                            value: selectedIds.contains(category.id),
                            onChanged: (bool? value) {
                              checkCategory(category.id);
                            },
                          ),
                          GoogleText(
                            text: category.name,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
                    Navigator.pop(widget.dialogContext);
                  },
                  child: GoogleText(
                    text: "Selesai",
                    color: kWhiteColor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
