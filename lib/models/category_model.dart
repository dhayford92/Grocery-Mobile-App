class Category {
  int? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}




// list of categories
List<Category> cate_list = [
  Category(
    id: 0,
    title: 'Vagetables'
  ),
  Category(
    id: 1,
    title: 'Fruit'
  ),
  Category(
    id: 2,
    title: 'Nuts and Beans'
  ),
  Category(
    id: 3,
    title: 'Dry'
  ),
];