import 'package:flutter/material.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield_password.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/auth/signup_screen.dart';
import 'package:waghetak_app/view/core/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";
  const LoginScreen({super.key});
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  titleTextStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontWeight: mainFontWeight,
                          ),
                  title: const Text(
                    "تسجيل الدخول",
                    textAlign: TextAlign.start,
                  ),
                  subtitle: const Text(
                    "ابدأ رحلتك معنا عبر تسجيل الدخول، ادخل إلى حسابك بسهولة وانطلق في استكشاف خدماتنا وتجاربنا المميزة.",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: constVerticalPadding,
                ),
                Text(
                  "البريد الالكتروني",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: constVerticalPadding,
                ),
                TextFormFieldCustom(
                  context: context,
                  labelText: "ادخل البريد الالكتروني",
                  controller: email,
                ),
                SizedBox(
                  height: constVerticalPadding,
                ),
                Text(
                  "كلمة المرور",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: constVerticalPadding,
                ),
                PasswordFormFieldCustom(
                  labelText: "ادخل كلمة المرور",
                  controller: email,
                ),
                SizedBox(height: constVerticalPadding),
                MainButton(
                  text: "تسجيل الدخول",
                  backGroundColor: primaryColor,
                  onTap: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false),
                ),
                SizedBox(height: constVerticalPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: blackColor)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("او"),
                    ),
                    Expanded(
                      child: Divider(color: blackColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ليس لديك حساب؟",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignupScreen.id);
                      },
                      child: Text(
                        "سجل الان",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
