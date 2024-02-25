import 'package:get/get.dart';

class ShopItem {
  final String title;
  final String description;
  final String image;
  final String price;
  final int id;
  bool isLiked;

  ShopItem({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.id,
    required this.isLiked,

  });

  Map<String, dynamic> toMap() {
    return {
      'title' : title,
      'description' : description,
      'image' : image,
      'price' : price,
      'id' : id,
      'isLiked' : isLiked ? 1 : 0
    };
  }

  factory ShopItem.fromMap(Map<String, dynamic> map) {
    print("Map from database: $map");
    return ShopItem(
      title: map['title'],
      description: map['description'],
      image: map['image'],
      price: map['price'].toString(),
      id: map['id'],
      isLiked: map['isLiked'] == 1
    );
  }
}


