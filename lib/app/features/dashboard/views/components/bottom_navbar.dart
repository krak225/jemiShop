import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/dashboard_controller.dart';
import '../screens/dashboard_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final DashboardController controller = Get.put(DashboardController(), permanent: false);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.tabIndex.value,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.home),
          icon: Icon(EvaIcons.homeOutline),
          label: "Accueil",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.bell),
          icon: Icon(EvaIcons.bellOutline),
          label: "Commandes",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.checkmarkCircle2),
          icon: Icon(EvaIcons.checkmarkCircle),
          label: "Mes produits",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.people),
          icon: Icon(EvaIcons.peopleOutline),
          label: "Mes clients",
        ),
        /*BottomNavigationBarItem(
          activeIcon: Icon(EvaIcons.messageSquare),
          icon: Icon(EvaIcons.messageSquareOutline),
          label: "Messages",
        ),*/
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).primaryColor.withOpacity(.5),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      onTap: (value) {
        controller.changeIndex(value);
        setState(() {
          index = value;
        });
      },
    );
  }
}
