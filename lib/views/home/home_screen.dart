import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:twistcode/apis/store.dart';
import 'package:twistcode/models/Item.dart';
import 'package:twistcode/providers/store.dart';
import 'package:twistcode/utils/size_config.dart';
import 'package:twistcode/views/home/components/dialog_category.dart';
import 'package:twistcode/views/home/components/dialog_filter.dart';
import 'package:twistcode/views/home/components/floating_search.dart';
import 'package:twistcode/views/home/components/network_error.dart';
import 'package:twistcode/views/home/components/store_header.dart';
import 'package:twistcode/views/home/components/store_item.dart';
import 'package:twistcode/views/home/components/store_loading_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isError = false;

  final TextEditingController _filterNamaController = TextEditingController();
  final TextEditingController _filterMinimumController = TextEditingController();
  final TextEditingController _filterMaximumController = TextEditingController();

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    StoreProvider storeProvider = Provider.of<StoreProvider>(context, listen: false);
    bool isSuccess = await StoreApi.initializeStoreData(storeProvider: storeProvider);

    setState(() {
      isLoading = false;
      isError = !isSuccess;
    });
  }

  void addToChart(ItemModel item) {
    StoreProvider storeProvider = Provider.of<StoreProvider>(context, listen: false);
    storeProvider.addChartItems(item.id);
    setState(() {});
  }

  void needRefresh() => setState(() {});

  void openFilter() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => DialogFilter(
        namaCtrl: _filterNamaController,
        MinCtrl: _filterMinimumController,
        MaxCtrl: _filterMaximumController,
        dialogContext: _,
      ),
    );
  }

  void openCategory() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => DialogCategory(
        namaCtrl: _filterNamaController,
        MinCtrl: _filterMinimumController,
        MaxCtrl: _filterMaximumController,
        dialogContext: _,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: !isLoading && !isError
          ? FloatingSearch(
              onFilterClick: openFilter,
              onCategoryClik: openCategory,
            )
          : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier! * 2),
          height: SizeConfig.heightMultiplier! * 100,
          child: Consumer<StoreProvider>(
            builder: (context, storeProvider, _) {
              if (isError && !isLoading) return NetworkError(onRetry: initData);

              int chartCounter = storeProvider.chartItems.fold(0, (sum, item) => sum += item.qty);
              return Column(
                children: [
                  StoreHeader(counter: chartCounter, needRefresh: needRefresh),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: isLoading
                            ? List.generate(10, (index) => StoreLoadingSection())
                            : List.generate(storeProvider.items.length, (index) {
                                ItemModel item = storeProvider.items[index];
                                return StoreItem(itemModel: item, onClick: (item) => addToChart(item));
                              }),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
