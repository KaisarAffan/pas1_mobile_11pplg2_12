import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:pas1_mobile_11pplg2_12/Page/menus/FavouritePage/favourited_page.dart';
import 'package:pas1_mobile_11pplg2_12/Page/menus/HomePage/home_page.dart';
import 'package:pas1_mobile_11pplg2_12/Page/menus/profile_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    FavouritedPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: MotionTabBar(
          initialSelectedTab: "Team",
          useSafeArea: true,
          labels: const ["Team", "Favorite", "Profile"],
          icons: const [
            Icons.ballot,
            Icons.favorite_border,
            Icons.person_outline
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          tabIconColor: Colors.grey[600],
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: Colors.blue[800],
          tabIconSelectedColor: Colors.white,
          onTabItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
    ;
  }
}
