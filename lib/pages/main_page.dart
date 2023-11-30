import 'package:c6_drones_app/consts/consts.dart';
import 'package:c6_drones_app/models/model.dart';
import 'package:c6_drones_app/pages/login_page.dart';
import 'package:c6_drones_app/widgets/perfil/perfil.dart';
import 'package:c6_drones_app/widgets/projetos/projetos.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:c6_drones_app/widgets/organizacoes/organizacoes.dart';
import 'package:provider/provider.dart';

PageController pageController = PageController();
SideMenuController sideMenu = SideMenuController();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<SideMenuItem> items;

  @override
  void initState() {
    // Initialize items in the initState
    items = [
      SideMenuItem(
        title: 'Perfil',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.account_circle_outlined),
      ),
      SideMenuItem(
        title: 'Organizações',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.corporate_fare),
      ),
      SideMenuItem(
        title: 'Projetos',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.description_outlined),
      ),
      SideMenuItem(
        title: 'Usuarios',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.groups_2_outlined),
      ),
      SideMenuItem(
        title: 'Sair',
        onTap: (index, _) {
          final sair = context.read<ModelA>();
          sair.zerarUsuarios();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const LoginPage()),
            ),
          );
        },
        icon: const Icon(Icons.logout_outlined),
      ),
    ];
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelA>(
      builder: (context, value, child) => Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              style: SideMenuStyle(
                displayMode: value.expand
                    ? SideMenuDisplayMode.compact
                    : SideMenuDisplayMode.auto,
                showTooltip: true,
              ),
              // Page controller to manage a PageView
              controller: sideMenu,

              // Will show on top of all items, it can be a logo or a Title text
              title: logo,

              // List of SideMenuItem to show them on SideMenu
              items: items,
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  Center(
                    child: PerfilPage(),
                  ),
                  Center(
                    child: Organizacoes(),
                  ),
                  Center(
                    child: Projetos(),
                  ),
                  Center(
                    child: Text('Usuarios'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
