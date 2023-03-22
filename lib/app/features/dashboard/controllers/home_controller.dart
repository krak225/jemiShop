import 'dart:convert';
import 'dart:io';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:dio/dio.dart' as dio;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../../constans/app_constants.dart';
import '../../../shared_components/card_task.dart';
import '../../../shared_components/build_liste_clients.dart';
import '../../../shared_components/list_task_date.dart';
import '../../../shared_components/selection_button.dart';
import '../../../shared_components/task_progress.dart';
import '../../../shared_components/user_profile.dart';
import '../../../utils/stdfn.dart';
import '../model/MyCommande.dart';
import '../model/client.dart';
import '../model/commande.dart';
import '../model/hellodepart_models.dart';
import '../model/produit.dart';

class HomeController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

  late List<Client> clients = List.empty();
  late List<Produit> produits = List.empty();
  late List<MyCommande> commandes = List.empty();
  late List<Depart> departs = List.empty();
  late RxList<CardTaskData> taskInProgress = <CardTaskData>[].obs;

  late RxInt STAT_TODAY = 0.obs;
  late RxInt STAT_TODAY_1 = 0.obs;
  late RxInt STAT_TODAY_2 = 0.obs;
  late RxInt STAT_TODAY_3 = 0.obs;
  late RxInt STAT_TODAY_4 = 0.obs;

  //////////
  final dataProfil = const UserProfileData(
    image: AssetImage(ImageUserPath.jemi),
    name: "Jemima KOFFI",
    jobDesk: "Directrice Générale",
  );

  final member = ["Avril Kimberly", "Michael Greg"];

  final dataTask = const TaskProgressData(totalTask: 5, totalCompleted: 1);

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

  void onPressedTask(int index, Client data) {
    //Fluttertoast.showToast(msg: data.label);
  }

  void onPressedAssignTask(int index, Client data) {}
  void onPressedMemberTask(int index, Client data) {}
  void onPressedCalendar() {}
  void onPressedTaskGroup(int index, Client data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }



  //

  Future<List<Depart>> fetchDeparts() async {

    String url = "http://127.0.0.1:8000/api/rechercher_departs/1/3/2023-03-22";

    final response = await http.get(Uri.parse(url), headers: {
      //HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      departs = parsed.map<Depart>((json) => Depart.fromJson(json)).toList();

      return departs;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load départs');

    }

  }

  Future<List<Client>> fetchClients() async {

    String url = "http://jobboard.target-ci.com/api/clients";

    final response = await http.get(Uri.parse(url), headers: {
      //HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      clients = parsed.map<Client>((json) => Client.fromMap(json)).toList();

      return clients;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load clients');

    }

  }

  Future<List<Produit>> fetchProduits() async {

    String url = "http://jobboard.target-ci.com/api/produits";

    final response = await http.get(Uri.parse(url), headers: {
      //HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      produits = parsed.map<Produit>((json) => Produit.fromJson(json)).toList();

      return produits;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load clients');

    }

  }


  Future<List<MyCommande>> fetchCommandes() async {

    String url = "http://jobboard.target-ci.com/api/commandes";

    final response = await http.get(Uri.parse(url), headers: {
      //HttpHeaders.authorizationHeader: 'Bearer $TOKEN_STORAGE',
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    print(url);

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      commandes = parsed.map<MyCommande>((json) => MyCommande.fromJson(json)).toList();

      var today_0 = DateTime.now();
      var today_1 = DateTime.now().subtract(const Duration(days: 1));
      var today_2 = DateTime.now().subtract(const Duration(days: 2));
      var today_3 = DateTime.now().subtract(const Duration(days: 3));
      var today_4 = DateTime.now().subtract(const Duration(days: 4));

      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      String today_0_formated = dateFormat.format(today_0);
      String today_1_formated = dateFormat.format(today_1);
      String today_2_formated = dateFormat.format(today_2);
      String today_3_formated = dateFormat.format(today_3);
      String today_4_formated = dateFormat.format(today_4);

      var STAT_TODAY = Stdfn.sumTotalCommandes(commandes.where((commande) => commande.commandeDateCreation!.contains(today_0_formated)));
      var STAT_TODAY_1 = Stdfn.sumTotalCommandes(commandes.where((commande) => commande.commandeDateCreation!.contains(today_1_formated)));
      var STAT_TODAY_2 = Stdfn.sumTotalCommandes(commandes.where((commande) => commande.commandeDateCreation!.contains(today_2_formated)));
      var STAT_TODAY_3 = Stdfn.sumTotalCommandes(commandes.where((commande) => commande.commandeDateCreation!.contains(today_3_formated)));
      var STAT_TODAY_4 = Stdfn.sumTotalCommandes(commandes.where((commande) => commande.commandeDateCreation!.contains(today_4_formated)));

      var MONTANT_TOTAL_COMMANDES = Stdfn.sumTotalCommandes(commandes);

      List<int> stats = [
        STAT_TODAY,
        STAT_TODAY_1,
        STAT_TODAY_2,
        STAT_TODAY_3,
        STAT_TODAY_4];

      int i = 0;
      for(var stat in taskInProgress){
        stat.label = Stdfn.toAmount(stats[i]).toString();
        stat.taux = (stats[i] * 100 / MONTANT_TOTAL_COMMANDES).toString();
        i++;
      }

      return commandes;

    } else {

      print("response Body: " + response.body);

      throw Exception('Failed to load commandes');

    }

  }

  @override
  void onInit() {
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY.toString(),
      taux: "0",
      jobDesk: "Aujourd'hui",
      dueDate: DateTime.now().add(const Duration(hours: 0)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_1.toString(),
      taux: "0",
      jobDesk: "Hier",
      dueDate: DateTime.now().subtract(const Duration(days: 1)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_2.toString(),
      taux: "0",
      jobDesk: "Avant-hier",
      dueDate: DateTime.now().subtract(const Duration(days: 2)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_3.toString(),
      taux: "0",
      jobDesk: "Il y a 3 jours",
      dueDate: DateTime.now().subtract(const Duration(days: 3)),
    ));
    taskInProgress.add(CardTaskData(
      label: STAT_TODAY_4.toString(),
      taux: "0",
      jobDesk: "Il y a 4 jours",
      dueDate: DateTime.now().subtract(const Duration(days: 4)),
    ));

    fetchCommandes();
    fetchProduits();
    //fetchClients();
  }

}
