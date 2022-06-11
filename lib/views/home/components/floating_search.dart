import 'package:flutter/material.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/size_config.dart';

class FloatingSearch extends StatelessWidget {
  const FloatingSearch({Key? key, required this.onCategoryClik, required this.onFilterClick}) : super(key: key);

  final Function onCategoryClik, onFilterClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier! * 9,
      width: SizeConfig.widthMultiplier! * 45,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onCategoryClik(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list),
                  GoogleText(text: 'Category'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => onFilterClick(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list),
                  GoogleText(text: 'Filter'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
