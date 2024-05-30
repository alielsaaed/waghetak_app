import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:waghetak_app/constants/constants.dart';

import '../../common compounents/main_button.dart';
import '../../common compounents/phone_number_container.dart';

class EditPhone extends StatefulWidget {
  static const String id = 'edit phone screen';

  const EditPhone({super.key});

  @override
  State<EditPhone> createState() => _EditPhoneState();
}

class _EditPhoneState extends State<EditPhone> {
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("تغيير رقم الهاتف"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: constVerticalPadding),
            const Text("رقم الهاتف"),
            SizedBox(height: constVerticalPadding),
            PhoneNumberField(
              onInputChanged: (PhoneNumber phoneNumber) {},
              phone: phoneNumber.text,
            ),
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
