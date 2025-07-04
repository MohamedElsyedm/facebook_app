import 'package:facebook_app/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CreateStorey extends StatelessWidget {
  const CreateStorey({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                15.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/user_image.jpg', // Replace with your image URL or AssetImage
                    width: 100,
                    // height: 150,
                    fit: BoxFit
                        .cover, // Ensures the image covers the area, clipping excess
                  ),
                ),
              const  Expanded(
                  child: Text(
                    '\nCreate a \n Story',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            radius: 13,
            child: Icon(
              Icons.add_circle,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
