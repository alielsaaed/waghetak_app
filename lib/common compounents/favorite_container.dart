import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/offer_details_screen.dart';

class OfferDetailsContainer extends StatelessWidget {
  const OfferDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset("$imagePath/banner-1.png"),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: ListTile(
                    title: Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset("$imagePath/Profile-Male-PNG.png"),
                        ),
                        SizedBox(width: constHorizontalPadding),
                        Text(
                          "وكالة فرسان السفر",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: whiteBackGround,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 30.0,
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent.withOpacity(0.1),
                      child: Icon(
                        Icons.bookmark,
                        color: whiteBackGround,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "رحلة سياحية ممتازة الى باريس 5000 ريال",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
      openBuilder: (context, action) => OfferDetailsScreen(),
    );
  }
}
