import 'package:ambulance/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  static String route = '/splash';

  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    offset = Tween<Offset>(begin: Offset(-3.0, 0.0), end: const Offset(6.0, 0.0)).animate(controller);
    offset.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
    controller.forward();
    Future.delayed(Duration(seconds: 5), () {
      Get.offNamed(HomeScreen.route);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        color: Colors.lightBlueAccent.withOpacity(0.07),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'the\n',
                      style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                    text: 'AMBULANCE',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: SlideTransition(
                position: offset,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/1834/1834905.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
