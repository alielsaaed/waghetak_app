import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:waghetak_app/common%20compounents/custom_checkbox.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield_password.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/common%20compounents/phone_number_container.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/auth/login_screen.dart';
import 'package:waghetak_app/view/core/home_screen.dart';

class SignupScreen extends StatefulWidget {
  static String id = "SignupScreen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  bool isChecked = false;

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
                    "انشاء حساب",
                    textAlign: TextAlign.start,
                  ),
                  subtitle: const Text(
                    "انطلق نحو تجربة فريدة! ابدأ رحلتك معنا عبر إنشاء حساب جديد، حيث يمكنك الوصول إلى مجموعة من الخدمات المميزة ",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: constVerticalPadding,
                ),
                Text(
                  "الاسم",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: constVerticalPadding,
                ),
                TextFormFieldCustom(
                  context: context,
                  labelText: "ادخل الاسم",
                  controller: name,
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
                  "رقم الهاتف",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: constVerticalPadding,
                ),
                PhoneNumberField(
                  onInputChanged: (PhoneNumber phoneNumber) {},
                  phone: phoneNumber.text,
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
                  text: "انشاء حساب",
                  backGroundColor: primaryColor,
                  onTap: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false),
                ),
                SizedBox(height: constVerticalPadding),
                Row(
                  children: [
                    CustomCheckbox(
                      isChecked: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(
                            text: " أوافق على",
                          ),
                          TextSpan(
                            onEnter: (event) {},
                            text: " شروط الاستخدام",
                            style: TextStyle(
                              color: primaryColor, // Color for Terms of Service
                              fontWeight: FontWeight.bold, // Make it bold
                            ),
                          ),
                          const TextSpan(
                            text: " لتطبيق واجهتك",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      " لديك حساب بالفعل؟",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        "تسجيل دخول",
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
