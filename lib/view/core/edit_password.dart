import 'package:flutter/material.dart';

import '../../common compounents/custom_textformfield_password.dart';
import '../../common compounents/main_button.dart';
import '../../constants/constants.dart';

class EditPassword extends StatefulWidget {
  static const String id = 'edit password screen';

  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("تغيير كلمة المرور"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: constVerticalPadding),
            const Text("كلمة المرور الحالية"),
            SizedBox(height: constVerticalPadding),
            PasswordFormFieldCustom(
                hintText: "ادخل كلمة المرور الحالية",
                controller: password,
                onChanged: (p0) {}),
            SizedBox(height: constVerticalPadding),
            const Text("كلمة المرور الجديدة"),
            SizedBox(height: constVerticalPadding),
            PasswordFormFieldCustom(
                hintText: "ادخل كلمة المرور الجديدة",
                controller: passwordConfirm,
                onChanged: (p0) {}),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: MainButton(
                text: "حفظ التعديلات",
                backGroundColor: primaryColor,
                textColor: Colors.white,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
