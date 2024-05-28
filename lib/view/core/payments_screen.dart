import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waghetak_app/common%20compounents/payment_icon.dart';
import 'package:waghetak_app/constants/constants.dart';

class PaymentsScreen extends StatefulWidget {
  static String id = "PaymentsScreen";

  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  bool paymentSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "معلومات الحجز",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: constVerticalPadding),
            Text(
              "نطلب منك إكمال جميع التفاصيل أدناه لإتمام الحجز",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: constVerticalPadding),
            Text(
              "طريقه الدفع",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PaymentIcon(imagePath: "$iconsPath/mada-icon.png"),
                PaymentIcon(imagePath: "$iconsPath/visa-icon.png"),
                PaymentIcon(imagePath: "$iconsPath/MasterCard-icon.png"),
                PaymentIcon(imagePath: "$iconsPath/paypal-icon.png"),
              ],
            ),
            SizedBox(height: constVerticalPadding),
            TextField(
              decoration: InputDecoration(
                labelText: 'صاحب البطاقة',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: constVerticalPadding),
            TextField(
              decoration: InputDecoration(
                labelText: 'رقم البطاقة',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 300.w,
                    height: 100.h,
                    child: ListTile(
                      title: Text(
                        'تاريخ الانتهاء',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: TextField(
                        decoration: InputDecoration(
                          labelText: 'شش/سسسس',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300.w,
                    height: 100.h,
                    child: ListTile(
                      title: Text(
                        'ارقام الكود',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: TextField(
                        decoration: InputDecoration(
                          labelText: 'ادخل ارقام الكود هنا',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
