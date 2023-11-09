import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/helpers/consts.dart';
import 'package:marvel/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
          child: Image.asset(
        "assets/inverted_logo.png",
        width: size.width * 0.8,
      )),
    );
  }
}
