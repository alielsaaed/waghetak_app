import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waghetak_app/view/core/settings_screen.dart';

import '../../constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  final List<ProfileItem> firstProfileListItem = [
    ProfileItem(
      title: "الأسئلة الشائعة",
      leadingIcon: Icon(
        CupertinoIcons.question_circle,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
    ),
    ProfileItem(
      title: "عن التطبيق",
      leadingIcon: Icon(
        CupertinoIcons.info,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
    ),
    ProfileItem(
      title: "الإعدادات",
      leadingIcon: Icon(
        Icons.settings,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
      onNavigationTap: (BuildContext context) {
        Navigator.of(context).pushNamed(SettingsScreen.id);
      },
    ),
    ProfileItem(
      title: "تواصل معنا",
      leadingIcon: Icon(
        CupertinoIcons.chat_bubble_text,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
    ),
    ProfileItem(
      title: "قيم التطبيق",
      leadingIcon: Icon(
        CupertinoIcons.star,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
    ),
    ProfileItem(
      title: "سياسة الخصوصية",
      leadingIcon: Icon(
        Icons.verified_user_outlined,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
    ),
    ProfileItem(
      title: "الشروط والأحكام",
      leadingIcon: Icon(
        Icons.description_outlined,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
    ),
  ];
  final List<ProfileItem> secondProfileListItem = [
    ProfileItem(
      title: "اللغة",
      leadingIcon: Icon(
        Icons.translate,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: TextButton(
        onPressed: () {},
        child: const Text(
          "العربية",
        ),
      ),
    ),
    ProfileItem(
      title: "تسجيل الخروج",
      leadingIcon: Icon(
        Icons.login_outlined,
        color: primaryColor,
        size: 30,
      ),
      trailingIcon: const Icon(CupertinoIcons.forward),
    ),
  ];

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: constVerticalPadding),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: firstProfileListItem.length,
            itemBuilder: (context, index) {
              final profileItems = firstProfileListItem[index];
              return ListTile(
                tileColor: const Color(0xff1B9AAA).withOpacity(0.03),
                leading: profileItems.leadingIcon,
                title: Text(profileItems.title),
                trailing: profileItems.trailingIcon,
                onTap: profileItems.onNavigationTap != null
                    ? () => profileItems.onNavigationTap!(context)
                    : null,
              );
            },
          ),
        ),
        SizedBox(height: constVerticalPadding),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: secondProfileListItem.length,
            itemBuilder: (context, index) {
              final profileItems = secondProfileListItem[index];
              return ListTile(
                tileColor: const Color(0xff1B9AAA).withOpacity(0.03),
                leading: profileItems.leadingIcon,
                title: Text(profileItems.title),
                trailing: profileItems.trailingIcon,
                onTap: profileItems.onNavigationTap != null
                    ? () => profileItems.onNavigationTap!(context)
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProfileItem {
  final String title;
  final Icon leadingIcon;
  final Widget trailingIcon;
  final Function(BuildContext)? onNavigationTap;

  ProfileItem(
      {required this.title,
      required this.leadingIcon,
      required this.trailingIcon,
      this.onNavigationTap});
}
