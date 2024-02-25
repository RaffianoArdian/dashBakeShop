import 'package:dashboard/utils/colors/title_text.dart';
import 'package:flutter/material.dart';

class CustomImageSliderItem extends StatelessWidget {
  final String imagePath;
  final String caption;

  CustomImageSliderItem({
    required this.imagePath,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              caption,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}

