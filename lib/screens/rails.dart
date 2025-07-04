import 'package:facebook_app/custom_widgets/rails_item.dart';
import 'package:facebook_app/data/data_item_class.dart';
import 'package:flutter/material.dart';

class RailsScreen extends StatelessWidget {
  const RailsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    List<DataItemClass> storyData = DataItemClass.dataItemList;

    return  Scaffold(
      body: PageView.builder(
        itemCount: storyData.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index)=>RailsItem(dataItemClass: storyData[index],),
      ),
    );
  }
}
