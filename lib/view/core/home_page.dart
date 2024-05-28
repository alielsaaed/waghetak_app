import 'package:flutter/material.dart';
import 'package:waghetak_app/common%20compounents/filter_bottom_sheet.dart';
import 'package:waghetak_app/common%20compounents/home_screen_banner.dart';
import 'package:waghetak_app/common%20compounents/most_popular_container.dart';
import 'package:waghetak_app/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SearchBar(
                    elevation: const MaterialStatePropertyAll(1),
                    surfaceTintColor: MaterialStatePropertyAll(darkGrey),
                    hintText: "أكتب كلمة البحث هنا",
                    hintStyle: MaterialStatePropertyAll(
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: grey,
                          ),
                    ),
                  ),
                ),
                SizedBox(width: constHorizontalPadding),
                InkWell(
                  onTap: () {
                    showFilterBottomSheet(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: const Icon(Icons.filter_alt),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constVerticalPadding,
          ),
          HomeScreenBanner(),
          ListTile(
            titleTextStyle: Theme.of(context).textTheme.bodyLarge,
            title: const Text("الاكثر شيوعا 🔥"),
            trailing: TextButton(
              onPressed: () {},
              child: const Text("عرض الكل"),
            ),
          ),
          MostPopulerContainer(),
          ListTile(
            titleTextStyle: Theme.of(context).textTheme.bodyLarge,
            title: const Text("الاكثر تقييما ⭐"),
            trailing: TextButton(
              onPressed: () {},
              child: const Text("عرض الكل"),
            ),
          ),
          MostPopulerContainer(),
        ],
      ),
    );
  }
}
