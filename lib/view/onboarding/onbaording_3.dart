import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/auth/login_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  static String id = "OnboardingScreen3";
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        backgroundColor: whiteBackGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset("$iconsPath/onboarding-3-icon.svg"),
              const ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "إدارة حجوزاتك بكل سهولة",
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "قم بإدارة جميع حجوزاتك السياحية بسهولة ويسر في مكان واحد. اطلع على تفاصيل الرحلات القادمة",
                  textAlign: TextAlign.center,
                ),
              ),
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 30,
                child: IconButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.id, (route) => false),
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
