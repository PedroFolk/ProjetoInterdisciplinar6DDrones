import 'package:c6_drones_app/widgets/perfil.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import '../consts/consts.dart';

PageController pageController = PageController();
SideMenuController sideMenu = SideMenuController();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  List<SideMenuItem> items = [
    SideMenuItem(
      title: 'Perfil',
      onTap: (index, _) {
        sideMenu.changePage(index);
      },
      icon: const Icon(Icons.account_circle_outlined),
    ),
    SideMenuItem(
      title: 'Settings',
      onTap: (index, _) {
        sideMenu.changePage(index);
      },
      icon: const Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            // Page controller to manage a PageView
            controller: sideMenu,

            // Will shows on top of all items, it can be a logo or a Title text
            title: logo,

            // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
            footer: const Text('demo'),

            // List of SideMenuItem to show them on SideMenu
            items: items,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                Center(
                  child: Perfil(),
                ),
                Center(
                  child: Text('Settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
