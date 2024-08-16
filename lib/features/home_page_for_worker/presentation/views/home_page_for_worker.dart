import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/show_orders/presentation/view/show_ordres.dart';
import 'package:maintenance_app1/features/vacation%20_request/presentation/view/vacation_request.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePageForWorker extends StatefulWidget {
  const HomePageForWorker({super.key});

  @override
  State<HomePageForWorker> createState() => _HomePageForWorkerState();
}

class _HomePageForWorkerState extends State<HomePageForWorker> {
  late PersistentTabController _controller;
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  List<Widget> _buildScreens() {
    return [const ShowOrdresPage(), const VacationRequest()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.build),
        title: ("طلبات الصيانة"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.white,
        scrollController: _scrollController1,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const ShowOrdresPage(),
            "/second": (final context) => const VacationRequest()
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person_off,
        ),
        title: ("طلب اجازة"),
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
