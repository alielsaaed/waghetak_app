import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/onboarding/onbaording_3.dart';

class OnboardingScreen2 extends StatelessWidget {
  static String id = "OnboardingScreen2";
  const OnboardingScreen2({super.key});

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
          leading: const BackButton(),
        ),
        backgroundColor: whiteBackGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset("$iconsPath/onboarding-2-icon.svg"),
              const ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "التواصل المباشر مع شركات السياحة",
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "تواصل مباشرةً مع شركات السياحة للحصول على أفضل العروض والنصائح المخصصة لرحلتك",
                  textAlign: TextAlign.center,
                ),
              ),
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 30,
                child: IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, OnboardingScreen3.id),
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
