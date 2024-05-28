import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/home_screen.dart';

class PaymentsInvoiceScreen extends StatelessWidget {
  const PaymentsInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset("$iconsPath/payment-success-icon.svg"),
              SizedBox(height: constVerticalPadding),
              Text(
                "5000 ريال",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: mainFontWeight,
                    ),
              ),
              SizedBox(height: constVerticalPadding),
              Text(
                "تمت عملية الدفع بنجاح",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text("المجموع الذي تم دفعه"),
                            subtitle: Text("169.99 ريال"),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("المجموع الذي تم دفعه"),
                            subtitle: Text("169.99 ريال"),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: const Text("عن طريق"),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "$iconsPath/mada-icon.png",
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text("المجموع الذي تم دفعه"),
                      subtitle: Text("169.99 ريال"),
                    ),
                    MainButton(
                      text: "عرض الفاتورة",
                      backGroundColor: primaryColor.withOpacity(0.2),
                      textColor: primaryColor,
                      onTap: () {
                        // Navigator.pushNamed(context, "/home");
                      },
                    ),
                    SizedBox(height: constVerticalPadding),
                    MainButton(
                      text: "العودة الى العروض",
                      backGroundColor: primaryColor,
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.id, (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
