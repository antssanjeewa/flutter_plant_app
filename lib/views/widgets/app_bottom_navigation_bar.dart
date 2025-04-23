import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/app/constants.dart';
import 'package:plant_app/app/pages.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  static const tabs = [Pages.home, Pages.favorite, Pages.setting];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int selectedIndex = tabs.indexWhere(
      (page) => location.startsWith(page.toPath()),
    );
    selectedIndex = selectedIndex < 0 ? 0 : selectedIndex;

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: AppSize.lg,
      elevation: 0,
      onTap: (index) {
        if (index != selectedIndex) {
          tabs[index].go(context);
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 0 ? Icons.home_filled : Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            selectedIndex == 1 ? Icons.favorite : Icons.favorite_border,
          ),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 2 ? Icons.settings : Icons.settings),
          label: "Favorite",
        ),
      ],
    );
  }
}
