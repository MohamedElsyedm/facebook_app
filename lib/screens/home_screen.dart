import 'package:facebook_app/custom_widgets/post_widget.dart';
import 'package:facebook_app/data/data_item_class.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../custom_widgets/create_story_widget.dart';
import '../custom_widgets/story_item_widget.dart';
import 'create_post_screen.dart';

class HomeScreenHead extends StatelessWidget {
  const HomeScreenHead({super.key});

  @override
  Widget build(BuildContext context) {

    List<DataItemClass> storyData = DataItemClass.dataItemList;

    return ListView.builder(
      itemCount: storyData.length,
      itemBuilder: (_, index) {
        if(index == 0){
          return Column(
            children: [
              // what is on your mind
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      const  CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user_image.jpg'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const CreatePostScreen(),),),
                          child:const Text(
                            'What’s on Your Mind?',
                            style: TextStyle(color: AppColors.gray, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.photo_library_outlined,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              Container(color: AppColors.gray, width: double.infinity, height: 2),
              //  stories
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: storyData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    if (index == 0) {
                      return const CreateStorey();
                    } else {
                      return StoryItemWidget(
                        dataItemClass: DataItemClass(
                            userImage: storyData[index].userImage,
                            userPost: storyData[index].userPost,
                          postDescription: '',
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(color: AppColors.gray, width: double.infinity, height: 2),
            ],
          );
        }
        //post
        return PostWidget(dataItemClass: storyData[index],);
      },
    );
  }
}
