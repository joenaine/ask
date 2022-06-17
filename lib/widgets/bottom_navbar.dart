import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teaching_app/config/colors_.dart';
import 'package:teaching_app/screens/index_screen.dart';
import 'package:teaching_app/screens/jobs_screen.dart';
import 'package:teaching_app/screens/search_screen.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List? _pages;

  // var _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      const IndexScreen(),
      const JobsScreen(),
      const SearchScreen(),
      const IndexScreen(),
      const IndexScreen(),
    ];

    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(width: .7),
        )),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 24,
          onTap: _selectedPage,
          backgroundColor: Colors.white,
          unselectedItemColor: Theme.of(context).textSelectionTheme.cursorColor,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/chat.svg"),
              tooltip: 'Feeds',
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/notification.svg'),
              tooltip: 'Cart',
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/notification.svg'),
              tooltip: 'Cart',
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
