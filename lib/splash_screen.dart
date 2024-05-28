import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
