import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'favorite_page.dart'; // Import your FavoritesPage
import 'package:dashboard/modules/controllers/home_ctrl.dart';
import 'package:dashboard/Page/DetailX.dart';
import 'package:dashboard/widget/card.dart';

class FavoritesPage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: _buildFavoritesGrid(), // Call the method to build the grid
    );
  }

  Widget _buildFavoritesGrid() {
    return Container(
      child: Obx(() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .55,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.shopItems.where((item) => item.isLiked).length,
        itemBuilder: (BuildContext ctxt, int index) {
          final likedItems = controller.shopItems.where((item) => item.isLiked).toList();
          return GestureDetector(
            onTap: () {
              Get.to(() => const DetailX(), arguments: {
                "image": likedItems[index].image,
                "title": likedItems[index].title,
                "description": likedItems[index].description,
                "price": likedItems[index].price,
              });
            },
            child: ShoppingItem(
              title: likedItems[index].title,
              description: likedItems[index].description,
              image: likedItems[index].image,
              price: likedItems[index].price,
              isLiked: likedItems[index].isLiked,
              function: () {
                controller.editShopItem(
                    likedItems[index].id,
                    likedItems[index].description,
                    likedItems[index].image,
                    likedItems[index].price,
                    likedItems[index].title,
                    !likedItems[index].isLiked);
              },
            ),
          );
        },
      )),
    );
  }
}

