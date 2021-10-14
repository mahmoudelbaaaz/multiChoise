import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_choise_app/resources/app_images.dart';
import 'package:multi_choise_app/resources/size.dart';
import 'package:multi_choise_app/utilities/navigator.dart';

import '../routes.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  @override
  void initState() {

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward(from: 0);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.decelerate,
        ));
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
print('splash');
          popAndPushName(context, AppRoute.SignUp);

      // popAndPushName(context, AppRoute.Login);
    });    super.initState();
  }



  late Timer timer;
 late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return

      Scaffold(
        body: Stack(
          children: [
            buildBackground(size),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeightBox(20),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: buildILogo(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }

  Image buildBackground(Size size) {
    return Image.asset(
      AppImages.background,
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
    );
  }

  Widget buildILogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(32)),
      child: Image.asset(
        AppImages.splash,
      ),
    );
  }



  @override
  void dispose() {
    timer.cancel();
    _controller.dispose();
    super.dispose();
  }
}
