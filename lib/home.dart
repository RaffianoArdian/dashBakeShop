import 'package:carousel_slider/carousel_slider.dart';
import 'package:dashboard/Page/DetailX.dart';
import 'package:dashboard/data/popular.dart';
import 'package:dashboard/data/trend.dart';
import 'package:dashboard/data/categoris.dart';
import 'package:dashboard/modules/bindings/home_binding.dart';
import 'package:dashboard/widget/favorite_page.dart';

import 'package:dashboard/utils/colors/colors.dart';
import 'package:dashboard/utils/colors/title_text.dart';
import 'package:dashboard/widget/card.dart';
import 'package:dashboard/widget/container.dart';
import 'package:dashboard/modules/controllers/home_ctrl.dart';

import 'package:dashboard/widget/info_card.dart';
import 'package:dashboard/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends GetView<HomeBinding> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final double tinggi = size.height / 4;
    double containerSize = MediaQuery.of(context).size.width * 0.3;
    return Scaffold(
      backgroundColor: db2_white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 40),
              child: Row(
                children: [
                  text(title, 18, title_color, FontWeight.bold),
                  Expanded(
                    child: SizedBox(),
                  ),
                  text(
                    language,
                    12,
                    db2_white,
                    FontWeight.normal,
                  ),SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: bg_lonceng,
                    child: Icon(
                      Icons.notifications,
                      color: lonceng,
                    ),
                    radius: 16,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: bgicon,
                  child: Icon(
                    Icons.location_on_outlined,
                    color: db2_black,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(city, 10, db2_white, FontWeight.normal),
                    text(cityy, 12, db2_white, FontWeight.normal)
                  ],
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20,
                ),
                SizedBox(
                  width: 20,
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: search,
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  filled: true,
                  fillColor: bg_search,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Tooltip(
                    message: 'mic',
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic_none,
                        color: bgicon,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                height: tinggi,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
              ),
              items: popular.map((Popular i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InfoCard(
                        title: i.nama,color: db2_white, imageUrl: i.image, height: 150);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: text(categori, 16, db2_black, FontWeight.bold)),
            SizedBox(height: 10.0),
            SizedBox(
              height: containerSize,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  int bgColorIndex = index % 4;
                  return CustomContainer(
                      borderRadius: 10,
                      color: bgColors[bgColorIndex],
                      widthPercent: 0.3,
                      heightPercent: 0.3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Image.asset(
                              categories[index].image
                            ),
                          ),
                          SizedBox(height: 15),
                          text(categories[index].nama, 10, db1_white,
                              FontWeight.bold),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ));
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: text(populardeals, 16, db2_black, FontWeight.bold)),
            Obx(() => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .55,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.shopItems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                print("Shop Items Length: ${controller.shopItems.length}");
                return GestureDetector(
                  onTap: () {
                    Get.to(() => const DetailX(), arguments: {
                      "image": controller.shopItems[index].image,
                      "title": controller.shopItems[index].title,
                      "description":controller.shopItems[index].description,
                      "price":controller.shopItems[index].price,
                    });
                  },
                  child: ShoppingItem(
                    title: controller.shopItems[index].title,
                    description: controller.shopItems[index].description,
                    image: controller.shopItems[index].image,
                    price: controller.shopItems[index].price,
                    isLiked: controller.shopItems[index].isLiked,
                    function: (){
                      controller.editShopItem(
                          controller.shopItems[index].id,
                          controller.shopItems[index].description,
                          controller.shopItems[index].image,
                          controller.shopItems[index].price,
                          controller.shopItems[index].title,
                          !controller.shopItems[index].isLiked);
                    },
                  ),
                );
              }
            )),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        color: db1_white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home_filled,
                color: nv,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: nv,
              ),
              onPressed: () {
                Get.to(FavoritesPage());}),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: nv,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: nv,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.white,
          child: ClipOval(
            child: Material(
              color: Colors.orange,
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child:
                      Icon(Icons.shopping_cart, color: db1_white), // Icon color
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: false,
    );
  }
}
