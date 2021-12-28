import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuisioner/controllers/mainController.dart';
import 'package:kuisioner/ui/signinPage.dart';
import 'package:kuisioner/ui/mainPage.dart';
import 'package:kuisioner/ui/spalshPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () {
        Get.put(MainController());
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: SafeArea(
        child: SplashPage(),
      ),
    );
  }
}
