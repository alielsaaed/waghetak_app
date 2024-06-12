import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';

class MostPopulerContainer extends StatelessWidget {
  // int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    "$imagePath/banner-1.png",
    "$imagePath/banner-2.png",
    "$imagePath/banner-3.png",
  ];

  MostPopulerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders =
        imgList.map((item) =>  MostPopulerWidget(items: item,)).toList();
    return CarouselSlider(
      items: imageSliders,
      carouselController: _controller,
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
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

class MostPopulerWidget extends StatelessWidget {
  final String items;
  const MostPopulerWidget({
    super.key, required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(items),
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
            Text(
              "رحلة سياحية ممتازة الى باريس 5000 ريال",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
