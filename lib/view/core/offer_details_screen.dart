import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/booking_information_screen.dart';

class OfferDetailsScreen extends StatelessWidget {
  final List<String> imgList = [
    "$imagePath/banner-1.png",
    "$imagePath/banner-2.png",
    "$imagePath/banner-3.png",
  ];
  OfferDetailsScreen({super.key});

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
                          const Text("وكالة فرسان السفر"),
                        ],
                      ),
                      const Text(
                        'رحلة سياحية ممتازة إلى باريس',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        'هنا النص هو مثال يمكن أن يستبدل في نفس المساحة..هنا النص هو مثال يمكن أن يستبدل في نفس المساحة..هنا النص هو مثال يمكن أن يستبدل في نفس المساحة..هنا النص هو مثال يمكن أن يستبدل في نفس المساحة..هنا النص هو مثال يمكن أن يستبدل في نفس المساحة...',
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
                      SizedBox(height: constVerticalPadding),
                      Row(
                        children: [
                          Builder(builder: (context) {
                            return Expanded(
                              child: MainButton(
                                text: "احجز الان",
                                backGroundColor: primaryColor,
                                onTap: () => Navigator.pushNamed(
                                    context, BookingInformationScreen.id),
                              ),
                            );
                          }),
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              child: ListTile(
                                title: Text('التكلفه',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                subtitle: const Text(
                                  '5000 ريال',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
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
