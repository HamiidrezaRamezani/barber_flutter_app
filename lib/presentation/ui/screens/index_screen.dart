import 'package:barber_application/presentation/system_design/app_sizes.dart';
import 'package:barber_application/presentation/system_design/app_sizes.dart';
import 'package:barber_application/presentation/ui/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../system_design/app_colors.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late PersistentTabController _persistentTabController;

  @override
  void initState() {
    _persistentTabController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      Container(
        color: Colors.yellow,
        child: Center(
          child: Text(
            "BookMark Screen",
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
      Container(
        color: Colors.green,
        child: Center(
          child: Text(
            "Map Screen",
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
      Container(
        color: Colors.grey,
        child: Center(
          child: Text(
            "Account Screen",
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.house_fill),
        title: ("Home"),
        activeColorPrimary: AppColors.primaryBackgroundColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bookmark_fill),
        title: ("Bookmark"),
        activeColorPrimary: AppColors.primaryBackgroundColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.location_solid),
        title: ("Map"),
        activeColorPrimary: AppColors.primaryBackgroundColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {},
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_alt),
        title: ("User"),
        activeColorPrimary: AppColors.primaryBackgroundColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {},
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.tabBorderRadius),
            topRight: Radius.circular(AppSizes.tabBorderRadius)),
      ),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: AppColors.whiteColor,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: false,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style12,
    );
  }
}
