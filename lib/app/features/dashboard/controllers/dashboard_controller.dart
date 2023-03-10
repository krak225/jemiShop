import 'dart:async';
import 'dart:io' as Io;
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../config/routes/app_pages.dart';
import '../../../constans/app_constants.dart';
import '../../../data/provider/repositories/register_repo.dart';
import '../../../shared_components/card_task.dart';
import '../../../shared_components/list_task_date.dart';
import '../../../shared_components/selection_button.dart';
import '../../../shared_components/task_progress.dart';
import '../../../shared_components/user_profile.dart';
import '../../../utils/ui/theme/snackbar_ui.dart';
import '../model/client.dart';
import '../views/screens/clients_screen.dart';
import '../views/screens/commandes_screen.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/messages_screen.dart';
import '../views/screens/produits_screen.dart';

class PhotoTemporaire {
  String uiid;
  File file;

  PhotoTemporaire({
    required this.uiid,
    required this.file,
  });
}

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  late Io.File file_picked;
  RxBool is_file_picked = false.obs;
  final RxList<PhotoTemporaire> photos = <PhotoTemporaire>[].obs;

  final RegisterRepo registerRepo = Get.find();
  final RxBool isLoading = false.obs;
  final GetStorage _storage = GetStorage();
  final RxBool has_photo1 = false.obs, has_photo2 = false.obs, has_photo3 = false.obs;

  final scafoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  DashboardController();

  bool scrollListener(ScrollNotification scrollInfo) {
    bool scroll = false;

    print(scrollInfo.metrics.pixels);

    if (scrollInfo.metrics.axis == Axis.vertical) {
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

  Future<void> pickPhotosProduit() async {

    is_file_picked = false.obs;

    FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
      //allowedExtensions: ['jpg', 'png', 'doc'],
    );

    if(pickedFiles != null) {

      for (var path in pickedFiles.paths) {
        var uiid = Uuid().v4();
        file_picked = Io.File(path!);

        photos.add(new PhotoTemporaire(uiid: uiid, file:file_picked));
      }

      print(photos);

    }else{
      SnackbarUi.error("Erreur lors de la sélection du document");
    }

  }


  Future<void> saveProduit() async {

    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      print(formKey.currentState!.value);

      var data = Map<String, dynamic>.from(formKey.currentState!.value);

      int i = 0;
      for (var ph in photos) {
        var filename = 'photo_'+i.toString();
        data[filename] = await dio.MultipartFile.fromFile(ph.file.path, filename: filename);
        i++;
      }

      var formData = dio.FormData.fromMap(data);

      dio.Response response = await this.registerRepo.saveProduit(data: formData);

      if (response.statusCode == 200) {
        isLoading.value = false;

        //
        photos.clear();

        SnackbarUi.success("Produit ajouté avec succès");

        Get.offAllNamed(AppPages.initial);

      } else {
        print(response.data);

        SnackbarUi.error(response.data.toString());
        isLoading.value = false;
      }

      isLoading.value = false;

    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
      isLoading.value = false;
    }

  }

  Future<void> updateProduit(int id) async {

  }

  Future<void> saveClient() async {

    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      //SnackbarUi.info(formKey.currentState!.value);
      print(formKey.currentState!.value);

      var data = Map<String, dynamic>.from(formKey.currentState!.value);

      var formData = dio.FormData.fromMap(data);

      dio.Response response = await this.registerRepo.saveClient(data: formData);

      print(response.data.toString());

      if (response.statusCode == 200) {
        isLoading.value = false;
        SnackbarUi.success("Client ajouté avec succès");

        //
        Get.offAllNamed(AppPages.initial);

      } else {
        SnackbarUi.error(response.data.toString());
        isLoading.value = false;
      }

      isLoading.value = false;

    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
      isLoading.value = false;
    }

  }


  Future<void> saveCommande() async {

    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      print(formKey.currentState!.value);

      var data = Map<String, dynamic>.from(formKey.currentState!.value);

      var formData = dio.FormData.fromMap(data);

      dio.Response response = await this.registerRepo.saveCommande(data: formData);

      print(response.data.toString());

      if (response.statusCode == 200) {
        isLoading.value = false;
        SnackbarUi.success("Commande ajouté avec succès");

        //
        Get.offAllNamed(AppPages.initial);

      } else {
        SnackbarUi.error(response.data.toString());
        isLoading.value = false;
      }

      isLoading.value = false;

    } else {
      SnackbarUi.error("Veuillez renseigner correctement le formulaire");
      isLoading.value = false;
    }

  }

  deletePhoto(var index) {
    photos.removeWhere((photo) => photo.uiid == index);
    Get.back();
  }



}
