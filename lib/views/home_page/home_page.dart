import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naseha/logic/auth_cubit/auth_cubit.dart';
import 'package:naseha/views/auth/auth_page.dart';
import 'package:naseha/views/news_feed/news_feed.dart';
import 'package:naseha/views/verify/verify_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [const NewsFeedScreen(), const AuthPage(), const VerifyScreen()],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.neumorphic,
      confineInSafeArea: true,
      backgroundColor: const Color(0xff90AFC5),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
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
      activeColorPrimary: const Color(0xff336B87),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: ('add'),
      activeColorPrimary: const Color(0xff336B87),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings),
      title: ('Settings'),
      activeColorPrimary: const Color(0xff336B87),
      inactiveColorPrimary: Colors.white,
    ),
  ];
}
