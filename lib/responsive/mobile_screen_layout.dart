import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController pageController;

  int _page = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void napBarTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          onPageChanged(value);
        },
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: ColorManager.mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _page == 0
                  ? ColorManager.tabBarIconActiveColor
                  : ColorManager.tabBarIconUnactiveColor,
            ),
            label: '',
            backgroundColor: ColorManager.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _page == 1
                  ? ColorManager.tabBarIconActiveColor
                  : ColorManager.tabBarIconUnactiveColor,
            ),
            label: '',
            backgroundColor: ColorManager.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: _page == 2
                  ? ColorManager.tabBarIconActiveColor
                  : ColorManager.tabBarIconUnactiveColor,
            ),
            label: '',
            backgroundColor: ColorManager.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              color: _page == 3
                  ? ColorManager.tabBarIconActiveColor
                  : ColorManager.tabBarIconUnactiveColor,
            ),
            label: '',
            backgroundColor: ColorManager.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: _page == 4
                  ? ColorManager.tabBarIconActiveColor
                  : ColorManager.tabBarIconUnactiveColor,
            ),
            label: '',
            backgroundColor: ColorManager.primaryColor,
          )
        ],
        onTap: (value) {
          napBarTapped(value);
        },
      ),
    );
  }
}
