import 'dart:async';

import 'package:e_commerce/views/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView1 extends StatefulWidget {
  const SplashView1({super.key});

  @override
  State<SplashView1> createState() => _SplashView1State();
}

class _SplashView1State extends State<SplashView1> {
  void navigateToNext() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svgs/splash_logo.svg")
      ],),),
    );
  }
}
