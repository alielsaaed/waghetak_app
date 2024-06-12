import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/booking_information_screen.dart';
import '../../model/home_model.dart';

class OfferDetailsScreen extends StatelessWidget {
  final HomeModel offerDetails;

  final List<String> imgList = [
    "$imagePath/banner-1.png",
    "$imagePath/banner-2.png",
    "$imagePath/banner-3.png",
  ];

  OfferDetailsScreen({super.key, required this.offerDetails});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Image.asset(
        item,
        height: 500,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    )
        .toList();

    // Calculate the duration between fromDate and toDate
    int duration = 0;
    if (offerDetails.fromDate != null && offerDetails.toDate != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final DateTime fromDate = formatter.parse(offerDetails.fromDate!);
      final DateTime toDate = formatter.parse(offerDetails.toDate!);
      duration = toDate.difference(fromDate).inDays;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: ImageSlideshow(
                        width: double.infinity,
                        height: 400,
                        initialPage: 0,
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        children: imageSliders,
                      ),
                    ),
                    const Positioned(
                      top: 40,
                      left: 10,
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Positioned(
                      top: 30,
                      right: 10,
                      child: BackButton(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "$iconsPath/فرسان-للسياحة-والسفر-1 1.png",
                            scale: 4,
                          ),
                          SizedBox(
                            width: constHorizontalPadding,
                          ),
                          Text(offerDetails.name ?? ""),
                        ],
                      ),
                      Text(
                        offerDetails.miniDescription ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        offerDetails.description ?? "",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: constVerticalPadding),
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
                          Text('$duration أيام'),
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
                      SizedBox(height: constVerticalPadding),
                      Row(
                        children: [
                          Expanded(
                            child: MainButton(
                              text: "احجز الان",
                              backGroundColor: primaryColor,
                              onTap: () => Navigator.pushNamed(
                                  context, BookingInformationScreen.id),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              child: ListTile(
                                title: Text('التكلفه',
                                    style: Theme.of(context).textTheme.bodySmall),
                                subtitle: Column(
                                  children: [
                                    Text(
                                      '${offerDetails.oldPrice} ريال',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${offerDetails.cost} ريال',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
