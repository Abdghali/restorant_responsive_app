class FoodItem {
  int? id;
  String? name;
  String? imageUrl;
  String? description;
  int? quantity;
  bool? isFavourite;

  double? price;
  double? rating;
  FoodItem(
      {required this.id,
      required this.name,
      required this.imageUrl,
      this.description,
      required this.price,
      this.rating,
      this.isFavourite = false,
      this.quantity = 1});

  FoodItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    price = (json['price'] as num).toDouble();
    rating = (json['rating'] as num).toDouble();
    isFavourite = json['isFavourite'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['isFavourite'] = this.isFavourite;
    data['quantity'] = this.quantity;
    return data;
  }
}
