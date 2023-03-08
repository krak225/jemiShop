import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../constans/app_constants.dart';
import '../../../shared_components/card_task.dart';
import '../../../shared_components/build_liste_clients.dart';
import '../../../shared_components/list_task_date.dart';
import '../../../shared_components/selection_button.dart';
import '../../../shared_components/task_progress.dart';
import '../../../shared_components/user_profile.dart';
import '../model/client.dart';
import '../views/screens/clients_screen.dart';
import '../views/screens/commandes_screen.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/liste_pages.dart';
import '../views/screens/messages_screen.dart';
import '../views/screens/produits_screen.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  final scafoldKey = GlobalKey<ScaffoldState>();
  // ignore: non_constant_identifier_names
  late AnimationController _ColorAnimationController;

  // ignore: non_constant_identifier_names
  late AnimationController _TextAnimationController;
  late Animation _colorTween, _homeTween, _workOutTween, _iconTween, _drawerTween;

  DashboardController();

  get ColorAnimationController => _ColorAnimationController;
  //get colorTween => _colorTween;
  //get homeTween => _homeTween;
  //get workOutTween => _workOutTween;
  //get iconTween => _iconTween;
  //get drawerTween => _drawerTween;

  bool scrollListener(ScrollNotification scrollInfo) {
    bool scroll = false;

    print(scrollInfo.metrics.pixels);

    if (scrollInfo.metrics.axis == Axis.vertical) {
      //_ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 80);

      //_TextAnimationController.animateTo(scrollInfo.metrics.pixels);
      return scroll = true;
    }


    return scroll;
  }

  late List<Client> clients;

  final tabIndex = 0.obs;
  List<Widget> pageList = [
    HomeScreen(),
    CommandesScreen(),
    ProduitsScreen(),
    ClientsScreen(),
    MessagesScreen(),
  ];

  final pageListTitle = ["Accueil", "Commandes", "Produits", "Clients"];

  Future<void> changeIndex(int? index) async {
    this.tabIndex.value = index ?? 0;
  }

  closeAppConfirm() {
    Get.defaultDialog(
      title: "Attention!",
      content: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "Vous êtes sur le point de sortie de l'application JemiShop.",
          textAlign: TextAlign.center,
        ),
      ),
      textConfirm: "CONTINUER",
      textCancel: "ANNULER",
      cancelTextColor: Colors.primaries[0],
      confirmTextColor: Colors.white,
      barrierDismissible: false,
      onConfirm: () async {
        SystemNavigator.pop();
      },
    );
  }

  //////////
  final dataProfil = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    name: "Jemima KOFFI",
    jobDesk: "Directrice Générale",
  );

  final member = ["Avril Kimberly", "Michael Greg"];

  final dataTask = const TaskProgressData(totalTask: 5, totalCompleted: 1);

  final taskInProgress = [
    CardTaskData(
      label: "130 700",
      taux:45,
      jobDesk: "Aujourd'hui",
      dueDate: DateTime.now().add(const Duration(hours: 4)),
    ),
    CardTaskData(
      label: "30 200",
      taux:12,
      jobDesk: "Hier",
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
    CardTaskData(
      label: "71 500",
      taux:6,
      jobDesk: "Avant-hier",
      dueDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
    CardTaskData(
      label: "123 500",
      taux:14,
      jobDesk: "Il y a 3 jours",
      dueDate: DateTime.now().add(const Duration(hours: 4)),
    ),
    CardTaskData(
      label: "52 000",
      taux:14,
      jobDesk: "Il y a 4 jours",
      dueDate: DateTime.now().add(const Duration(hours: 4)),
    ),
  ];

  final taskGroup = [
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 10)),
        label: "5 posts on instagram",
        jobdesk: "Marketing",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 11)),
        label: "Platform Concept",
        jobdesk: "Animation",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 5)),
        label: "UI UX Marketplace",
        jobdesk: "Design",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 6)),
        label: "Create Post For App",
        jobdesk: "Marketing",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 5)),
        label: "2 Posts on Facebook",
        jobdesk: "Marketing",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 6)),
        label: "Create Icon App",
        jobdesk: "Design",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 8)),
        label: "Fixing Error Payment",
        jobdesk: "Programmer",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 10)),
        label: "Create Form Interview",
        jobdesk: "System Analyst",
      ),
    ]
  ];

  void onPressedProfil() {}

  void onSelectedMainMenu(int index, SelectionButtonData value) {
    changeIndex(index);
    Get.back();
  }
  void onSelectedTaskMenu(int index, String label) {
    //changeIndex(index);
    print(index);
  }

  void searchTask(String value) {}

  void onPressedTask(int index, Client data) {
    //Fluttertoast.showToast(msg: data.label);
  }

  void onPressedAssignTask(int index, Client data) {}
  void onPressedMemberTask(int index, Client data) {}
  void onPressedCalendar() {}
  void onPressedTaskGroup(int index, ListTaskDateData data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }

  @override
  void onInit() {

    //_ColorAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));

    //_colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
    //    .animate(_ColorAnimationController);

    /*
    _iconTween =
        ColorTween(begin: Colors.white, end: Colors.lightBlue.withOpacity(0.5))
            .animate(_ColorAnimationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_ColorAnimationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_ColorAnimationController);
    _workOutTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_ColorAnimationController);
    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

     */

    super.onInit();

  }

}
