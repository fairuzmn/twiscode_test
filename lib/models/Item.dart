import 'dart:math';

import 'package:twistcode/models/category.dart';

class ItemModel {
  final String id, name, location, username, itemCondition, imageUrl;
  final num price, weight;
  final bool isSoldOut, isHalal;
  final CategoryModel category;

  ItemModel(this.id, this.name, this.location, this.username, this.itemCondition, this.price, this.weight, this.isSoldOut, this.isHalal, this.category, this.imageUrl);

  ItemModel.fromJson(Map<String, dynamic> json, CategoryModel categoryModel)
      : id = json['id'],
        name = json['title'],
        location = json['location_name'],
        username = json['user']['user_name'],
        itemCondition = json['condition_of_item']['name'],
        price = double.tryParse(json['price']) ?? 0,
        weight = double.tryParse(json['weight']) ?? 0,
        isSoldOut = json['is_sold_out'] == '1',
        isHalal = json['is_halal'] == '1',
        category = categoryModel,
        imageUrl = 'https://picsum.photos/600/400?x' + (Random().nextInt(9999)).toString();
}
