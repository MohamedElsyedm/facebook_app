import 'package:facebook_app/data/data_item_class.dart';
import 'package:facebook_app/screens/rails.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class StoryItemWidget extends StatelessWidget {
  DataItemClass dataItemClass;
  StoryItemWidget({required this.dataItemClass, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const RailsScreen())),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  15.0), // Apply a circular border radius of 15
              child: Image.asset(
                'assets/images/${dataItemClass.userPost}', // Replace with your image URL or AssetImage
                width: 100,
                height: 150,
                fit: BoxFit
                    .cover, // Ensures the image covers the area, clipping excess
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundColor: AppColors.blue,
                radius: 17,
                //u can use circle 
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage('assets/images/${dataItemClass.userImage}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
