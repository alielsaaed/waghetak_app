import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/onboarding/onbaording_3.dart';
import 'package:waghetak_app/view/onboarding/onboarding_2.dart';

class OnboardingScreen1 extends StatelessWidget {
  static String id = "OnboardingScreen1";
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, OnboardingScreen3.id),
              child: Text(
                "تخطي",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: primaryColor,
                    ),
              ),
            )
          ],
        ),
        backgroundColor: whiteBackGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset("$iconsPath/onboarding-1-icon.svg"),
              const ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "استكشاف العروض السياحية",
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "استكشف مجموعة متنوعة من العروض السياحية المثيرة والمميزة في جميع أنحاء العالم. ابحث، قارن، واحجز رحلتك المثالية بسهولة",
                  textAlign: TextAlign.center,
                ),
              ),
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 30,
                child: IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, OnboardingScreen2.id),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: whiteBackGround,
                    )),
              )
            ],
          ),
        ));
  }
}
