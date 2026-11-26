import 'package:flutter/material.dart';
import 'package:taguinod_mobprog/constants.dart';
import 'package:taguinod_mobprog/screens/newsfeed_screen.dart';
import 'package:taguinod_mobprog/screens/notification_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen  extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  static const _pageTitles = ['KDA Updates', 'Notifications', 'Marketplace', 'Profile'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        shadowColor: fbTextColorWhite,
        elevation: 2,
        title: Text(
          _pageTitles[_selectedIndex],
          style: TextStyle(
            fontSize: ScreenUtil().setSp(25),
            color: fbPrimary,
            fontFamily: 'Klavika',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          NewsfeedScreen(),
          NotificationScreen(),
          _PlaceholderPage(icon: Icons.storefront, message: 'Marketplace'),
          _PlaceholderPage(icon: Icons.person, message: 'Your profile'),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: navigationBarColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: navigationUnselectedColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onTappedBar,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Marketplace'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: fbTextColorWhite,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: fbPrimary),
          const SizedBox(height: 8),
          Text(message, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
