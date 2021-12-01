import 'package:flutter/material.dart';
import 'package:testapp/screens/create.dart';
import 'package:testapp/screens/home.dart';
import 'package:testapp/screens/explore.dart';
import 'package:testapp/screens/profile.dart';
import 'package:testapp/screens/search.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _activeNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const Home(),
      const Search(),
      const Explore(),
      const Create(),
      const Profile(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: _activeNavBarIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeNavBarIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1565C0),
        unselectedItemColor: const Color(0xFF94B9E2),
        onTap: (index) {
          setState(() {
            _activeNavBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              backgroundColor: Colors.red,
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: 'explore'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_rounded,
              ),
              label: 'create'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}
