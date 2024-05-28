import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/reservation_screen.dart';

class BookingInvoiceScreen extends StatelessWidget {
  static String id = "BookingInvoiceScreen";
  const BookingInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("التفاصيل"),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReservationCard(
                status: 'ملغي',
                imageUrl: 'https://via.placeholder.com/15089',
                title: 'رحلة سياحية ممتازة الى باريس',
                price: '5000 ريال',
              ),
              SizedBox(
                height: constVerticalPadding,
              ),
              Text(
                "حول الرحلة",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: constVerticalPadding,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: redColor.withOpacity(0.2),
                    child: Icon(
                      Icons.calendar_today,
                      color: redColor,
                    ),
                  ),
                  SizedBox(width: constHorizontalPadding / 5),
                  const Text('7 أيام'),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.amber.withOpacity(0.2),
                    child: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(width: constHorizontalPadding / 5),
                  const Text('4.8 (8541 تقييم)'),
                ],
              ),
              SizedBox(
                height: constVerticalPadding,
              ),
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
                      title: Text("رقم العملية"),
                      subtitle: Text("55675676"),
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
                title: Text("تاريخ التسديد"),
                subtitle: Text("22 سبتمبر 2023"),
              ),
              SizedBox(
                height: constVerticalPadding,
              ),
              MainButton(
                text: "الغاء الحجز",
                backGroundColor: redColor.withOpacity(0.3),
                textColor: redColor,
              ),
              SizedBox(
                height: constVerticalPadding,
              ),
              MainButton(
                text: "تحميل الفاتورة",
                backGroundColor: primaryColor.withOpacity(0.3),
                textColor: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
