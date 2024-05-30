import 'package:flutter/material.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield.dart';
import 'package:waghetak_app/constants/constants.dart';

import '../../common compounents/main_button.dart';

class EditEmail extends StatefulWidget {
  static const String id = 'edit email screen';

  const EditEmail({super.key});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("تغيير البريد الإلكتروني"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: constVerticalPadding),
              const Text("البريد الإلكتروني"),
              SizedBox(height: constVerticalPadding),
              TextFormFieldCustom(
                context: context,
                controller: email,
                hintText: "Wjhtak@gmail.com",
              ),
              const Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: MainButton(
                  text: "حفظ التعديلات",
                  backGroundColor: const Color(0xff1B9AAA),
                  textColor: Colors.white,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
