import 'dart:math';

import 'package:facebook_app/colors/app_colors.dart';
import 'package:facebook_app/data/data_item_class.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  DataItemClass dataItemClass;
  PostWidget({required this.dataItemClass, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // u can use listTile instead of this compo(all padding)
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${dataItemClass.userImage}'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataItemClass.userName),
                      Row(
                        children: [
                          Text(
                            '${dataItemClass.postTime}h\t.',
                            style: const TextStyle(
                                color: AppColors.gray,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const Icon(
                            Icons.public,
                            color: AppColors.gray,
                            size: 12,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        Image.asset('assets/images/${dataItemClass.userPost}'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // u can use spacer widget instead of secound row
              Row(
                children: [
                  const Icon(Icons.favorite_border),
                  const SizedBox(width: 8),
                  const Icon(Icons.sms_outlined),
                  const SizedBox(width: 8),
                  Transform.rotate(
                    angle: -(pi / 6),
                    child: const Icon(Icons.send_rounded),
                  ),
                ],
              ),
              const Icon(Icons.bookmark_border_outlined)
            ],
          ),
        ),
        //u can use divider instead container
        // Divider(thickness: 1,),
        Container(color: AppColors.gray, width: double.infinity, height: 2),
      ],
    );
  }
}
