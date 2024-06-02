import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/favorite_screen.dart';
import 'package:waghetak_app/view/core/home_page.dart';
import 'package:waghetak_app/view/core/notifications_screen.dart';
import 'package:waghetak_app/view/core/profile_screen.dart';
import 'package:waghetak_app/view/core/reservation_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const FavoriteScreen(),
    const ReservationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Image.asset(
              "$imagePath/Profile-Male-PNG.png",
            ),
          ),
        ),
        title: const ListTile(
          title: Text("مرحبا! احمد"),
          subtitle: Text("مرحبا بك في واجهتك"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () =>
                Navigator.of(context).pushNamed(NotificationScreen.id),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'حجوزاتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'البروفايل',
          ),
        ],
      ),
    );
  }
}
