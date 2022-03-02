import 'package:ambulance/pages/home.dart';
import 'package:ambulance/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: Splash.route, page: () => Splash()),
        GetPage(name: HomeScreen.route, page: () => HomeScreen()),
      ],
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(seconds: 2),
      initialRoute: Splash.route,
    );
  }
}
