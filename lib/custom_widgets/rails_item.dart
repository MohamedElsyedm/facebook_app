import 'package:facebook_app/colors/app_colors.dart';
import 'package:facebook_app/data/data_item_class.dart';
import 'package:flutter/material.dart';

class RailsItem extends StatelessWidget {
  DataItemClass dataItemClass;

   RailsItem({required this.dataItemClass, super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.black,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/${dataItemClass.userPost}',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          const Padding(
            padding:  EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.search_rounded, color: AppColors.white,),
                SizedBox(width: 10),
                Icon(Icons.person_outline_rounded, color: AppColors.white,)
              ],
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(9.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               CircleAvatar(
                 backgroundColor: AppColors.blue,
                 radius: 22,
                 child: CircleAvatar(
                   backgroundImage: AssetImage('assets/images/${dataItemClass.userImage}'),
                 ),
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Text(dataItemClass.userName, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w900),),
                       SizedBox(width: 10),
                       Icon(Icons.public, color: AppColors.white,)
                     ],
                   ),
                   SizedBox(
                       width: 125,
                       child: Text('${dataItemClass.postDescription}', overflow: TextOverflow.ellipsis,style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),),),
                 ],
               ),
               OutlinedButton(
                   onPressed: (){},
                   child:const Text('Follow', style: TextStyle(color: AppColors.white),),
               ),
               const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite_border, color: AppColors.white),
                    Text('16K',style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.white),),
                    SizedBox(height: 15),
                    Icon(Icons.chat_bubble_outline_sharp , color: AppColors.white),
                    Text('200', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.white),),
                    SizedBox(height: 15),
                    Icon(Icons.share_outlined, color: AppColors.white),
                    Text('65', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.white),),
                    SizedBox(height: 15),
                    Icon(Icons.call, color: AppColors.white),
                    Text('Send', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.white),),
                    SizedBox(height: 15),
                    Icon(Icons.more_horiz, color: AppColors.white),
                    SizedBox(height: 15),
                  ],
                ),
             ],
           ),
         ),
        ],
      ),
    );
  }
}
