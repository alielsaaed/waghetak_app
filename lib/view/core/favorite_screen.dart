import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waghetak_app/common%20compounents/favorite_container.dart';
import 'package:waghetak_app/constants/constants.dart';

class FavoriteScreen extends StatelessWidget {
  static String id = "FavoriteScreen";
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Flexible(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) => const OfferDetailsContainer(),
          //     itemCount: 5,
          //     shrinkWrap: true,
          //   ),
          // )
        ],
      ),
    );
  }
}
