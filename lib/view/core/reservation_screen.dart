import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:waghetak_app/view/core/booking_invoice_screen.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, BookingInvoiceScreen.id),
                    child: ReservationCard(
                      status: index % 2 == 0 ? 'مكتمل' : 'ملغي',
                      imageUrl: 'https://via.placeholder.com/15089',
                      title: 'رحلة سياحية ممتازة الى باريس',
                      price: '5000 ريال',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final String status;
  final String imageUrl;
  final String title;
  final String price;

  const ReservationCard({
    super.key,
    required this.status,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteBackGround,
      surfaceTintColor: whiteBackGround,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "$imagePath/Rectangle 25350.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(width: constHorizontalPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'وكالة فرسان السفر',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: status == 'مكتمل' ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(color: whiteBackGround),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
