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
import '../../../shared_components/list_task_assigned.dart';
import '../../../shared_components/list_task_date.dart';
import '../../../shared_components/selection_button.dart';
import '../../../shared_components/task_progress.dart';
import '../../../shared_components/user_profile.dart';
import '../Models/client.dart';
import '../views/screens/clients_screen.dart';
import '../views/screens/commandes_screen.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/liste_pages.dart';
import '../views/screens/produits_screen.dart';

class DashboardController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();
  late List<Comment> clients;

  final tabIndex = 0.obs;
  List<Widget> pageList = [
    HomeScreen(),
    CommandesScreen(),
    ProduitsScreen(),
    ClientsScreen(),
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

  void onPressedTask(int index, Comment data) {
    //Fluttertoast.showToast(msg: data.label);
  }

  void onPressedAssignTask(int index, Comment data) {}
  void onPressedMemberTask(int index, Comment data) {}
  void onPressedCalendar() {}
  void onPressedTaskGroup(int index, ListTaskDateData data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }



}
