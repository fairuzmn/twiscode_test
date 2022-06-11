class CategoryModel {
  final String id, name;

  CategoryModel(this.id, this.name);

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['cat_id'],
        name = json['cat_name'];
}
