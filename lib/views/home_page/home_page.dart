import 'package:flutter/material.dart';
import 'package:naseha/views/add_naseha/screen/add_naseha_screen.dart';
import 'package:naseha/views/news_feed/screen/news_feed.dart';
import 'package:naseha/views/porfile/screen/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [NewsFeedScreen(), AddNasehaScreen(), ProfileScreen()],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.neumorphic,
      confineInSafeArea: true,
      backgroundColor: Colors.black54,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color(0xFFD6D6D6),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.newspaper),
      title: ('Home'),
      activeColorPrimary: Colors.grey,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: ('add'),
      activeColorPrimary: Colors.grey,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ('Profile'),
      activeColorPrimary: Colors.grey,
      inactiveColorPrimary: Colors.white,
    ),
  ];
}
