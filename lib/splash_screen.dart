import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'dart:async';
import 'package:waghetak_app/view-model/functions/check_token.dart';
import 'package:waghetak_app/view/core/home_screen.dart';
import 'package:waghetak_app/view/onboarding/onboarding_1.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () async {
      bool token = await Checktoken().hasToken();
      if (kDebugMode) {
        print("Token: $token");
      }
      token
          ? Navigator.pushReplacementNamed(context, HomeScreen.id)
          : Navigator.pushReplacementNamed(context, OnboardingScreen1.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "وجهتك",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: whiteBackGround,
                fontSize: 50,
              ),
        ),
      ),
    );
  }
}
