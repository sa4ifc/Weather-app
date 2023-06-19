import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ustudient/pages/home.dart';
import 'package:ustudient/pages/newpost.dart';
import 'package:ustudient/pages/settings.dart';
import 'package:ustudient/user/message.dart';
class routes extends StatelessWidget {
  const routes({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    List<Widget> _buildScreens() {
        return [
          home_screen(),
          settings(),
          messages(),
          settings(),
          settings(),
        ];
    }

 List<PersistentBottomNavBarItem> _navBarsItems() {
  Color disable = Colors.black26;
        return [
            PersistentBottomNavBarItem(
                icon: FaIcon(FontAwesomeIcons.homeUser,),
                title: ("Home"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: disable,
            ),
        
                   PersistentBottomNavBarItem(
                icon: FaIcon(FontAwesomeIcons.search,),
                title: ("search"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: disable,
            ),
              PersistentBottomNavBarItem(
                icon: FaIcon(FontAwesomeIcons.comment),
                title: ("Chat"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: disable,
            ),     PersistentBottomNavBarItem(
                icon: FaIcon(FontAwesomeIcons.bookmark,),
                title: ("bookmark"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: disable,
            ),

              

                PersistentBottomNavBarItem(
                icon: FaIcon(FontAwesomeIcons.user),
                title: ("Settings"),
                activeColorPrimary: Colors.blue,
                inactiveColorPrimary: disable,
            ),
         
        ];
    }
_controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}