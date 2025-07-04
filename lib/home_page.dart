import 'package:facebook_app/colors/app_colors.dart';
import 'package:facebook_app/screens/home_screen.dart';
import 'package:facebook_app/screens/rails.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'Facebook',
          style: TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.w800,
            fontSize: 30,
          ),
        ),
        actions: const [
          Icon(Icons.add_box, color: AppColors.black,),
          SizedBox(width: 12),
          Icon(Icons.search_rounded, color: AppColors.black,),
          SizedBox(width: 12),
          ImageIcon(
            AssetImage('assets/images/Messenger.png'),
            color: AppColors.black,
          ),
          SizedBox(width: 20),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs:  [
            const Tab(icon: Icon(Icons.home_filled)),
            const Tab(icon: Icon(Icons.ondemand_video_rounded)),
            const Tab(icon: Icon(Icons.store_mall_directory)),
            const Tab(icon: Icon(Icons.person_outline_rounded)),
            const Tab(icon: Icon(Icons.notifications_none)),
            Tab(
              icon: Container(
                clipBehavior: Clip.antiAlias,
                decoration:const BoxDecoration( shape: BoxShape.circle),
                child:
                  Image.asset('assets/images/user_image.jpg'),
              ),
            ),
          ],
          indicatorColor: AppColors.blue,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          labelColor: AppColors.blue,

        ),
      ),
      body:TabBarView(
        controller: _tabController, // Assign the same controller
        children: const [
          HomeScreenHead(),
          RailsScreen(),
          Center(child: Text('shop Content')),
          Center(child: Text('person Content')),
          Center(child: Text('notifications Content')),
          Center(child: Text('profile Content')),
        ],
      ),
    );
  }
}
