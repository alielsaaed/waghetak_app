import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/common%20compounents/most_popular_container.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/booking_information_screen.dart';

class AgencyScreen extends StatelessWidget {
  final List<String> imgList = [
    "$imagePath/banner-1.png",
    "$imagePath/banner-2.png",
    "$imagePath/banner-3.png",
  ];
  AgencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Image.asset(
            item, // Replace with your image URL
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        )
        .toList();
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
                        /// Width of the [ImageSlideshow].
                        width: double.infinity,

                        /// Height of the [ImageSlideshow].
                        height: 400,

                        /// The page to show when first creating the [ImageSlideshow].
                        initialPage: 0,

                        /// The color to paint the indicator.
                        indicatorColor: Colors.blue,

                        /// The color to paint behind th indicator.
                        indicatorBackgroundColor: Colors.grey,
                        children: imageSliders,
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
                            scale: 2,
                          ),
                          SizedBox(
                            width: constHorizontalPadding,
                          ),
                          Text(
                            "وكالة فرسان السفر",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      Text(
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: MainButton(
                              backGroundColor: primaryColor.withOpacity(0.3),
                              textColor: primaryColor,
                              text: "عروض الشركة",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BookingInformationScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: constHorizontalPadding),
                          Expanded(
                            child: MainButton(
                              backGroundColor: grey.withOpacity(0.3),
                              textColor: grey,
                              text: "تقييمات الشركة",
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      MostPopulerContainer(),
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
