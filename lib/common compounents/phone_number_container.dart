import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:waghetak_app/constants/constants.dart';

class PhoneNumberField extends StatelessWidget {
  final void Function(PhoneNumber)? onInputChanged;
  String? phone;

  PhoneNumberField({super.key, required this.onInputChanged, this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: InternationalPhoneNumberInput(
        validator: (p0) {
          if (p0!.isEmpty) {
            return "برجاء ادخال رقم الهاتف";
          }
          return null;
        },
        onInputChanged: onInputChanged,
        // isEnabled: phone == null ? true : false,
        inputDecoration: InputDecoration(
          border: InputBorder.none, // Remove input border
          labelText: "رقم الهاتف ",
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: grey,
              ),
        ),
        maxLength: 11,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        formatInput: false,
        autoValidateMode: AutovalidateMode.disabled,
        initialValue: PhoneNumber(isoCode: 'SA', phoneNumber: phone),
      ),
    );
  }
}
