import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waghetak_app/constants/constants.dart';

class PaymentIcon extends StatelessWidget {
  final String imagePath;
  bool paymentSelected = false;

  PaymentIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        paymentSelected = !paymentSelected;
      },
      child: Container(
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: paymentSelected ? primaryColor : grey,
            width: 2,
          ),
        ),
        child: Image.asset(
          imagePath,
          scale: 4,
        ),
      ),
    );
  }
}
