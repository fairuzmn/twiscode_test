import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:twistcode/models/Item.dart';
import 'package:twistcode/models/category.dart';
import 'package:twistcode/models/chart_item.dart';

class StoreProvider extends ChangeNotifier {
  List<ItemModel> _items = [];
  List<ChartItemModel> _chartItems = [];
  List<CategoryModel> _categoryItems = [];

  set items(List<ItemModel> items) {
    _items = items;
  }

  UnmodifiableListView<ItemModel> get items => UnmodifiableListView(_items);

  set chartItems(List<ChartItemModel> chartItems) {
    _chartItems = chartItems;
  }

  UnmodifiableListView<ChartItemModel> get chartItems => UnmodifiableListView(_chartItems);

  set categoryItems(List<CategoryModel> categoryItems) {
    _categoryItems = categoryItems;
  }

  UnmodifiableListView<CategoryModel> get categoryItems => UnmodifiableListView(_categoryItems);

  void addChartItems(String itemId) {
    int index = _chartItems.indexWhere((e) => e.itemId == itemId);
    if (index == -1) {
      _chartItems.add(ChartItemModel(itemId, 1));
    } else {
      _chartItems[index].qty += 1;
    }
  }

  void delChartItems(String itemId) {
    int index = _chartItems.indexWhere((e) => e.itemId == itemId);
    if (index == -1) return;

    if (_chartItems[index].qty > 1) {
      _chartItems[index].qty -= 1;
    } else {
      _chartItems.removeAt(index);
    }
  }
}
