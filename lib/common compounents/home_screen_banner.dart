import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';

class HomeScreenBanner extends StatelessWidget {
  // int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    "$imagePath/banner-1.png",
    "$imagePath/banner-2.png",
    "$imagePath/banner-3.png",
  ];
  final List<Map<String, String>> titleAndSubtitle = [
    {"رحلة الى مدريد": "5000 ريال"},
    {"رحلة الى برشلونه": "5790 ريال"},
    {"رحلة الى القاهره": "9000 ريال"},
  ];

  HomeScreenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.contain, width: 1000.0),
                      Positioned(
                        // bottom: 20.0,
                        left: 100.0,
                        right: 10.0,
                        top: 80.0,
                        child: ListTile(
                          titleTextStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: whiteBackGround,
                                  ),
                          subtitleTextStyle:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: whiteBackGround,
                                  ),
                          title: Text(titleAndSubtitle[imgList.indexOf(item)]
                              .keys
                              .first),
                          subtitle: Text(
                            titleAndSubtitle[imgList.indexOf(item)]
                                .values
                                .first,
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return CarouselSlider(
      items: imageSliders,
      carouselController: _controller,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          // setState(() {
          //   _current = index;
          // });
        },
      ),
    );
  }
}
