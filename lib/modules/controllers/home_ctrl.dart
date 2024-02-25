import 'package:dashboard/data/popular.dart';
import 'package:dashboard/data/trend.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/data/database_helper.dart';
import 'package:dashboard/data/shop_item_data.dart';

class HomeController extends GetxController {
  var shopItems = <ShopItem>[].obs;

  void onInit() {
    super.onInit();
    fetchShopItems(); // Fetch notes from database when HomeController initializes
  }

  Future<void> fetchShopItems() async {
    var shopItemFromDB = await DbHelper.getShopItem();
    shopItems.value = shopItemFromDB.map((noteMap) => ShopItem.fromMap(noteMap)).toList();
  }

  void editShopItem(int id, String description, String image, String price, String newTitle, bool isLiked) async {
    var updatedShopItem = ShopItem(
      id: id,
      description: description,
      image: image,
      price: price,
      title: newTitle,
      isLiked: isLiked
    );
    await DbHelper.updateShopItem(updatedShopItem.toMap()); // Update in database
    fetchShopItems(); // Fetch updated notes
  }

}