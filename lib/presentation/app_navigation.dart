import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'home/home_params.dart';
import 'home/widgets/add_button.dart';
import 'setting/setting_page.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;
  late PageController _pageController;

  final homeParams = HomeParams();

  void _onItemBottomTapped(int index) => setState(() {
        _currentIndex = index;
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          children: [
            HomePage(
              params: homeParams,
            ),
            const SettingPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          onTap: _onItemBottomTapped,
        ),
        floatingActionButton: AddButton(
          setOnTapListener: () => homeParams.onAddButtonTapped?.call(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
