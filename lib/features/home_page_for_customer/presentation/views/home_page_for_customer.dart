import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/show_electrical.dart';
import 'package:maintenance_app1/features/home_page_for_customer/presentation/views/widgets/test_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePageForCustomer extends StatefulWidget {
  const HomePageForCustomer({super.key});

  @override
  State<HomePageForCustomer> createState() => _HomePageForCustomerState();
}

class _HomePageForCustomerState extends State<HomePageForCustomer> {
  late PersistentTabController _controller;
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  List<Widget> _buildScreens() {
    return [const ShowElectrical(), const TestingWidget()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.white,
        scrollController: _scrollController1,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const ShowElectrical(),
            "/second": (final context) => const TestingWidget(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Test"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.white,
        scrollController: _scrollController2,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            // "/first": (final context) => const MainScreen2(),
            // "/second": (final context) => const MainScreen3(),
          },
        ),
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.grey[700]!,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property
    );
  }
}
