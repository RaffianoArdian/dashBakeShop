import 'package:dashboard/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailX extends StatelessWidget {
  const DetailX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments;
    return Scaffold( appBar: AppBar()
      ,body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                border: Border.all(
                  color: Colors.black, // Set the border color
                  width: 2.0, // Set the border width
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                child: Image.asset(
                  "${product["image"]}",
                  width: 360, // Adjust the width as needed
                  height: 300, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),

      SizedBox(),
      Container(
        margin: EdgeInsets.only(left: 10,bottom: 4),
          child: Text("${product["title"]}",style: TextStyle(fontSize: 25,),)),
        Container(
          margin: EdgeInsets.only(left: 10),
            child: Text("${product["description"]}")),
        SizedBox(height: 70,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: db1_green,
                  ),
                  child: Text(
                    "Buy",
                    style: TextStyle(color: Colors.white,fontSize: 23),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("Rp${product["price"]}",
               style: TextStyle(fontSize: 24,color: Colors.green,fontWeight: FontWeight.bold),
              ),
            ),
          ],

          // children: [
          //   Container(
          //       margin: EdgeInsets.only(top: 10,left: 20),
          //       child: Text("Rp${product["price"]}",style: TextStyle(fontSize:24,color: Colors.green,fontWeight: FontWeight.bold),)),
          //
          // ],
        ),
    ]),
    );

  }
}
