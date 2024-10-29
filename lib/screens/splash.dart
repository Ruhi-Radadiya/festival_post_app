import 'dart:async';
import 'package:flutter/material.dart';

import '../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, Routes.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Image.network(
            "https://i.pinimg.com/564x/13/66/a7/1366a7c17447d5384a59374b0667cdca.jpg",
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
