import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String route = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('home'),
      ),
    );
  }
}
