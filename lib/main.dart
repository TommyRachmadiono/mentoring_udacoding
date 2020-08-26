import 'package:flutter/material.dart';
import 'package:mentoring_udacoding/pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentoring Udacoding',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
