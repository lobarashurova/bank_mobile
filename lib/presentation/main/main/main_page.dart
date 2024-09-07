import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/calendar/calendar_main/calendar_main_page.dart';
import 'package:bank_mobile/presentation/main/home/home_page.dart';
import 'package:bank_mobile/presentation/main/meetings/meeting_page.dart';
import 'package:flutter/material.dart';

import '../profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> screenList = [
    HomePage(),
    CalendarMainPage(),
    MeetingPage(),
    ProfilePage(),
  ];

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: context.colors.display,
        selectedItemColor: context.colors.scaffoldColor,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: context.colors.display),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: context.colors.scaffoldColor,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined,
                  color: context.colors.display),
              label: 'Calendar',
              activeIcon: Icon(
                Icons.calendar_month_outlined,
                color: context.colors.scaffoldColor,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: context.colors.display),
              label: 'Meetings',
              activeIcon: Icon(
                Icons.camera_alt,
                color: context.colors.scaffoldColor,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: context.colors.display),
              label: 'Profile',
              activeIcon: Icon(
                Icons.person,
                color: context.colors.scaffoldColor,
              )),
        ],
      ),
    );
  }
}
