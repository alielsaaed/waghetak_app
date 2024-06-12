import 'package:flutter/material.dart';
import 'package:waghetak_app/common%20compounents/custom_checkbox.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield_password.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/auth/login_screen.dart';

class PasswordForgotScreen extends StatefulWidget {
  static String id = "PasswordForgotScreen";
  const PasswordForgotScreen({super.key});

  @override
  State<PasswordForgotScreen> createState() => _PasswordForgotScreenState();
}

class _PasswordForgotScreenState extends State<PasswordForgotScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                titleTextStyle:
                    Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: mainFontWeight,
                        ),
                title: const Text(
                  "اعادة تعيين كلمة المرور",
                  textAlign: TextAlign.start,
                ),
                subtitle: const Text(
                  "يمكنك الان عادة تعيين كلمة المرور الخاصة بك عن طريق كتابة كلمة المرور الجديدة و كذلك تأكيد كلمة المرور",
                  textAlign: TextAlign.start,
                ),
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
                controller: password,
              ),
              SizedBox(height: constVerticalPadding),
              Text(
                "تاكيد كلمة المرور",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: constVerticalPadding,
              ),
              PasswordFormFieldCustom(
                labelText: "ادخل كلمة المرور",
                controller: passwordConfirm,
              ),
              SizedBox(height: constVerticalPadding),
              MainButton(
                text: "تاكيد",
                backGroundColor: primaryColor,
              ),
              SizedBox(height: constVerticalPadding),
            ],
          ),
        ),
      ),
    );
  }
}
