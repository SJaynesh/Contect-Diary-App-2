import 'dart:async';

import 'package:contacts_diary/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.homePage);
    });
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            "assets/images/splash/contact.png",
            height: 150.h,
          ),
          const Spacer(),
          const LinearProgressIndicator(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
