import 'dart:convert';
import 'dart:io';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../constans/app_constants.dart';
import '../../../shared_components/card_task.dart';
import '../../../shared_components/list_task_assigned.dart';
import '../../../shared_components/list_task_date.dart';
import '../../../shared_components/selection_button.dart';
import '../../../shared_components/task_progress.dart';
import '../../../shared_components/user_profile.dart';
import '../Models/client.dart';

class HomeController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

  late List<Comment> comments = List.empty();

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
      label: "27 500",
      taux:45,
      jobDesk: "Aujourd'hui",
      dueDate: DateTime.now().add(const Duration(hours: 4)),
    ),
    CardTaskData(
      label: "32 200",
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
      label: "52 500",
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

  late final weeklyTask = [
    ListTile(
      leading: const Icon(EvaIcons.monitor, color: Colors.blueGrey),
      title: Text("Parfum AIDI"),
      subtitle: Text(DateTime.now().add(-const Duration(hours: 2)).toString()),
      trailing: Text("AB".getInitialName(2).toUpperCase()),
    ),
    ListTile(
      leading: const Icon(EvaIcons.star, color: Colors.amber),
      title: Text("Parfum AIDI"),
      subtitle: Text(DateTime.now().add(-const Duration(hours: 2)).toString()),
      trailing: Text("AB".getInitialName(2).toUpperCase()),
    ),
    ListTile(
      leading: Icon(EvaIcons.colorPalette, color: Colors.blue),
      title: Text("Parfum AIDI"),
      subtitle: Text(DateTime.now().add(-const Duration(hours: 2)).toString()),
      trailing: Text("AB".getInitialName(2).toUpperCase()),
    ),
    ListTile(
      leading: Icon(EvaIcons.pieChart, color: Colors.redAccent),
      title: Text("Parfum AIDI"),
      subtitle: Text(DateTime.now().add(-const Duration(hours: 2)).toString()),
      trailing: Text("AB".getInitialName(2).toUpperCase()),
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
  void onPressedTaskGroup(int index, Comment data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }



  //

  Future<List<Comment>> fetchClients() async {

    String url = "http://jobboard.target-ci.com/api/clients";

    final response = await http.get(Uri.parse(url), headers: {
      //HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
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


}
