import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waghetak_app/common%20compounents/toggle_switch.dart';
import 'package:waghetak_app/view/core/edit_account.dart';
import 'package:waghetak_app/view/core/edit_email.dart';
import 'package:waghetak_app/view/core/edit_password.dart';
import 'package:waghetak_app/view/core/edit_phone.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'Settings screen';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<SettingsItem> settingsItem = [
    SettingsItem(
      title: "تعديل الحساب",
      tile: const Icon(CupertinoIcons.forward),
      onNavigationTap: (BuildContext context) {
        Navigator.of(context).pushNamed(EditAccount.id);
      },
    ),
    SettingsItem(
      title: "البريد الإلكتروني",
      tile: const Icon(CupertinoIcons.forward),
      onNavigationTap: (BuildContext context) {
        Navigator.of(context).pushNamed(EditEmail.id);
      },
    ),
    SettingsItem(
      title: "رقم الهاتف",
      tile: const Icon(CupertinoIcons.forward),
      onNavigationTap: (BuildContext context) {
        Navigator.of(context).pushNamed(EditPhone.id);
      },
    ),
    SettingsItem(
      title: "كلمة المرور",
      tile: const Icon(CupertinoIcons.forward),
      onNavigationTap: (BuildContext context) {
        Navigator.of(context).pushNamed(EditPassword.id);
      },
    ),
    SettingsItem(
      title: "الوضع الليلي",
      tile: const ToggleSwitch(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        title: const Text("الإعدادات"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: settingsItem.length + 1,
              itemBuilder: (context, index) {
                if (index == settingsItem.length) {
                  return Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "حذف الحساب",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    ],
                  );
                }
                final settingsItems = settingsItem[index];
                return ListTile(
                  tileColor: const Color(0xff1B9AAA).withOpacity(0.03),
                  title: Text(settingsItems.title),
                  trailing: settingsItems.tile,
                  onTap: settingsItems.onNavigationTap != null
                      ? () => settingsItems.onNavigationTap!(context)
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsItem {
  final String title;
  final Widget tile;
  final Function(BuildContext)? onNavigationTap;

  SettingsItem({required this.title, required this.tile, this.onNavigationTap});
}
