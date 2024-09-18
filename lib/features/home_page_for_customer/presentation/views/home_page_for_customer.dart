import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/show_electrical.dart';
import 'package:maintenance_app1/features/show_qr/presentation/views/widgets/show_qr.dart';
import 'package:maintenance_app1/features/show_requsts/presentation/views/view_requsts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomePageForCustomer extends StatefulWidget {
  const HomePageForCustomer({super.key});

  @override
  State<HomePageForCustomer> createState() => _HomePageForCustomerState();
}

class _HomePageForCustomerState extends State<HomePageForCustomer> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      const ShowElectrical(),
      const ShowRequsts(),
      const ShowQr(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.electrical_services),
        title: ("Electrical"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.list_alt),
        title: ("Requests"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.qr_code),
        title: ("Show QR"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.white,
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
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.grey[700]!,
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
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property
    );
  }
}
