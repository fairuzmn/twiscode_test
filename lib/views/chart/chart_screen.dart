import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twistcode/models/Item.dart';
import 'package:twistcode/models/chart_item.dart';
import 'package:twistcode/providers/store.dart';
import 'package:twistcode/utils/colors.dart';
import 'package:twistcode/utils/widgets/google_text.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/views/chart/components/chart_empty.dart';
import 'package:twistcode/views/chart/components/chart_footer.dart';
import 'package:twistcode/views/chart/components/chart_item_card.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  int totalChart = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    calculateTotal();
  }

  void calculateTotal() {
    StoreProvider storeProvider = Provider.of<StoreProvider>(context, listen: false);
    int _total = 0;

    storeProvider.chartItems.forEach((chartItem) {
      ItemModel itemModel = storeProvider.items.firstWhere((item) => item.id == chartItem.itemId);
      _total += chartItem.qty * itemModel.price.toInt();
    });

    setState(() => totalChart = _total);
  }

  void changeQty(String id, bool isPlus) {
    StoreProvider storeProvider = Provider.of<StoreProvider>(context, listen: false);

    if (isPlus) {
      storeProvider.addChartItems(id);
    } else {
      storeProvider.delChartItems(id);
    }

    calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<StoreProvider>(
          builder: (BuildContext context, storeProvider, Widget? _) {
            if (storeProvider.chartItems.isEmpty) {
              return ChartEmpty();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 5, vertical: SizeConfig.heightMultiplier! * 3),
                  child: GoogleText(
                    text: "Produk yang akan anda pesan",
                    fontSize: SizeConfig.textMultiplier! * 2.6,
                    color: kPrimaryTextColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 4),
                    child: ListView.builder(
                      itemCount: storeProvider.chartItems.length,
                      itemBuilder: (context, index) {
                        ChartItemModel chartItem = storeProvider.chartItems[index];
                        ItemModel item = storeProvider.items.where((e) => e.id == chartItem.itemId).first;
                        return ChartItemCard(item: item, chartItem: chartItem, changeQty: changeQty);
                      },
                    ),
                  ),
                ),
                ChartFooter(totalChart: totalChart),
              ],
            );
          },
        ),
      ),
    );
  }
}
