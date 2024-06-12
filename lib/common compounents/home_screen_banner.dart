import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waghetak_app/constants/constants.dart';
import '../../model/home_model.dart';
import '../view/core/offer_details_screen.dart';
import '../view_model/cubits/home_cubit/home_cubit.dart';
import '../view_model/cubits/home_cubit/home_states.dart';
import '../view_model/services/home_api.dart';

class HomeScreenBanner extends StatelessWidget {
  final CarouselController _controller = CarouselController();

  HomeScreenBanner({super.key});

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
            final List<Widget> imageSliders = homeInfoList
                .map((item) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OfferDetailsScreen(offerDetails: item),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset("assets/images/banner-1.png",
                            fit: BoxFit.contain, width: 1000.0),
                        Positioned(
                          left: 100.0,
                          right: 10.0,
                          top: 80.0,
                          child: ListTile(
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                              color: whiteBackGround,
                            ),
                            subtitleTextStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                              color: whiteBackGround,
                            ),
                            title: Text(item.name ?? 'No Name'),
                            subtitle: Text(
                                '${item.cost ?? 'No Cost'} ريال'),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
                .toList();

            return CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
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