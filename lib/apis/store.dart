import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twistcode/models/Item.dart';
import 'package:twistcode/models/category.dart';
import 'package:twistcode/providers/store.dart';

class StoreApi {
  static const URL = 'https://ranting.twisdev.com/index.php/rest/items/search/api_key/teampsisthebest/';

  static Future<List<dynamic>> getData() async {
    try {
      http.Response response = await http.post(Uri.parse(URL));
      List<dynamic> result = jsonDecode(response.body);
      return result;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> initializeStoreData({required StoreProvider storeProvider}) async {
    List<dynamic> json = await getData();
    if (json.isEmpty) return false; // Network Error

    List<ItemModel> _items = [];
    List<CategoryModel> _listCategory = [];

    json.forEach((item) {
      CategoryModel _category = CategoryModel(item['category']['cat_id'], item['category']['cat_name']);
      _items.add(ItemModel.fromJson(item, _category));

      bool isExist = _listCategory.where((category) => category.id == _category.id).isNotEmpty;
      if (!isExist) _listCategory.add(_category);
    });

    storeProvider.items = _items;
    storeProvider.categoryItems = _listCategory;
    return true;
  }
}
