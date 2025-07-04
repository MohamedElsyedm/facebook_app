import 'package:facebook_app/colors/app_colors.dart';
import 'package:facebook_app/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _logoOpacity = 1.0; // Fade in the logo
      });
    });

    _performInitialLoad();
  }

  Future<void> _performInitialLoad() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {  //if widget in tree
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedOpacity(
              opacity: _logoOpacity,
              duration: const Duration(seconds: 2),
              child: const  Padding(
                padding:  EdgeInsets.only(top: 150),
                child: CircleAvatar(
                  backgroundColor: AppColors.blue,
                  radius: 40,
                  child: Text(
                    'f',
                    style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const CircularProgressIndicator(color: AppColors.blue),
                const SizedBox(height: 80),
                const Text('From', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.gray),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/meta_logo_.png',width: 55,),
                    const SizedBox(width: 5,),
                    const Text('Meta', style: TextStyle(fontSize: 37,color: AppColors.blue),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}