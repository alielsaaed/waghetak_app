import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waghetak_app/constants/constants.dart';
import '../../model/home_model.dart';
import '../view_model/cubits/home_cubit/home_cubit.dart';
import '../view_model/cubits/home_cubit/home_states.dart';
import '../view_model/services/home_api.dart';

class MostPopulerContainer extends StatefulWidget {

  MostPopulerContainer({super.key});

  @override
  State<MostPopulerContainer> createState() => _MostPopulerContainerState();
}

class _MostPopulerContainerState extends State<MostPopulerContainer> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeApi())..fetchHomeInfo(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is HomeLoaded) {
            List<HomeModel> homeInfoList = state.homeInfoList;
            homeInfoList.shuffle();
            final List<HomeModel> randomItems = homeInfoList.take(5).toList();  // Take a random subset

            final List<Widget> imageSliders = randomItems
                .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset("assets/images/banner-1.png"),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: ListTile(
                            title: Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset(
                                      "$imagePath/Profile-Male-PNG.png"),
                                ),
                                SizedBox(width: constHorizontalPadding),
                                Text(
                                  item.name ?? 'no name ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
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
                            onTap: () {
                            },
                            child: CircleAvatar(
                              backgroundColor:
                              Colors.transparent.withOpacity(0.1),
                              child: Icon(
                                Icons.bookmark,
                                color: whiteBackGround,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        "${item.miniDescription ?? 'No Description'} ${item.cost ?? 'No Cost'} ريال",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ))
                .toList();

            return CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
