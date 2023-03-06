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
import '../views/screens/clients_screen.dart';
import '../views/screens/commandes_screen.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/liste_pages.dart';
import '../views/screens/produits_screen.dart';

class DashboardController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

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

  Future<List<Comment>> fetchClients(String type) async {

    String user_id = _storage.read(AppConstants.USER_ID).toString();
    String TOKEN_STORAGE = _storage.read(AppConstants.TOKEN_STORAGE).toString();

    String url = AppConstants.API_URL + "/offres/"+user_id +"/"+type;
    print (url);
    //print(TOKEN_STORAGE);

    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      comments = parsed.map<Comment>((json) => Comment.fromMap(json)).toList();

      return comments;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load offres');

    }

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

  final weeklyTask = [
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.monitor, color: Colors.blueGrey),
      label: "Parfum AIDI",
      jobDesk: "Richmond Kouassi",
      assignTo: "RK",
      editDate: DateTime.now().add(-const Duration(hours: 2)),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.star, color: Colors.amber),
      label: "Parfum Karma 65",
      jobDesk: "Jessica",
      assignTo: "Justin Beck",
      editDate: DateTime.now().add(-const Duration(hours: 3)),
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.colorPalette, color: Colors.blue),
      label: "Rolex NIVEA ",
      jobDesk: "Cédric Kouamé",
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.pieChart, color: Colors.redAccent),
      label: "Un sac à dos",
      jobDesk: "Coulibaly Bakary",
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.monitor, color: Colors.blueGrey),
      label: "Parfum 1",
      jobDesk: "Richmond Kouassi",
      assignTo: "RK",
      editDate: DateTime.now().add(-const Duration(hours: 2)),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.star, color: Colors.amber),
      label: "Parfum 2",
      jobDesk: "Jessica",
      assignTo: "Justin Beck",
      editDate: DateTime.now().add(-const Duration(hours: 3)),
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.colorPalette, color: Colors.blue),
      label: "Rolex 3 ",
      jobDesk: "Cédric Kouamé",
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.pieChart, color: Colors.redAccent),
      label: "Un sac",
      jobDesk: "Coulibaly Bakary",
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

  void onPressedTask(int index, ListTaskAssignedData data) {
    //Fluttertoast.showToast(msg: data.label);
  }

  void onPressedAssignTask(int index, ListTaskAssignedData data) {}
  void onPressedMemberTask(int index, ListTaskAssignedData data) {}
  void onPressedCalendar() {}
  void onPressedTaskGroup(int index, ListTaskDateData data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }
}
