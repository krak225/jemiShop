import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../features/dashboard/model/produit.dart';
import '../utils/ui/theme/custom_input_decoration.dart';
import '../utils/ui/theme/light_color.dart';
import '../utils/ui/theme/themes.dart';
import '../utils/validator_state.dart';

class DetailsProduit extends StatelessWidget {
  final DashboardController controller = Get.find();
  Produit produit;

  DetailsProduit(this.produit);

  @override
  Widget build(BuildContext context) {

    print(produit.photo?.length.toString());
    produit.photo!.map((photo) => {
      print(photo.photoSrc.toString())
    });

    return SingleChildScrollView(
      child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32), ),
          child:
          Container(
            color: Colors.white,
            child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/01/23/91/84/360_F_123918405_djz92sSnn2hVzgvjNsgzWKBvFoeSZ3R3.jpg"
                      ),
                      fit: BoxFit.cover
                  )
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    alignment: Alignment(0.0, 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24.0,
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.teal,
                        size:24.0,
                      ),
                    ),
                  )
                ),
              ),
              SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  AutoSizeText(
                    "Modification d'un produit",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  ],
                ),
                FormBuilder(
                key: controller.formKey,

                ///initialValue: controller.initValues,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(children: [
                  SizedBox(height: 10),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'nom',
                      initialValue: produit.produitNom,
                      validator: ValidatorState.required,
                      decoration: CustomInputDecoration.style1(labelText: 'Nom du prduit'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'prix',
                      initialValue: produit.produitPrix.toString(),
                      validator: ValidatorState.required,
                      decoration: CustomInputDecoration.style1(labelText: 'Prix'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderDropdown(
                      name: 'categorie',
                      validator: ValidatorState.required,
                      decoration: CustomInputDecoration.style1(labelText: 'Catégorie'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Parfum'),
                          value: '1',
                        ),
                        DropdownMenuItem(
                          child: Text('Huile capillaire'),
                          value: '2',
                        ),
                        DropdownMenuItem(
                          child: Text('Divers'),
                          value: '3',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'stock',
                      initialValue: produit.produitQuantiteRestante.toString(),
                      decoration: CustomInputDecoration.style1(labelText: 'Stock disponible'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'description',
                      initialValue: "",
                      decoration: CustomInputDecoration.style1(labelText: 'Description'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(child:Text("Joindres des photos",
                      style: Themes.globalFont(style: TextStyle(color: LightColor.black, fontSize: 12)),
                      textAlign: TextAlign.left,
                    )
                  ),
                  FadeInRight(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: [
                            BoxShadow(
                              color: LightColor.lightGrey2,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Obx(()=> SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                                child: Row(
                                children: [
                                  Row(
                                    children: produit.photo!.map((photo) =>FadeInRight(
                                      child: GestureDetector(
                                        onLongPress: () =>
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0)), //this right here
                                                      child: Container(
                                                          height: 280,
                                                          width: 170,
                                                          child: Column(
                                                              children: [
                                                                Container(padding: EdgeInsets.only(top: 10), child: Text("Aperçu de la photo", style: TextStyle(fontSize: 14, color: Colors.primaries.last))),
                                                                Divider(color: Colors.grey[200]),
                                                                Container(width: 170, height: 170,
                                                                  decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(photo.photoSrc!),
                                                                        fit: BoxFit.cover),
                                                                  ),
                                                                ),
                                                                Divider(color: Colors.grey[200]),
                                                                Row(
                                                                  children: [
                                                                    const BackButton(),
                                                                    const Expanded(child: Center()),
                                                                    IconButton(
                                                                      icon: const Icon(Icons.delete, color: Colors.red),
                                                                      tooltip: 'Supprimer',
                                                                      onPressed: () => controller.deletePhotoOnServer(photo.photoId!),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ])
                                                      )
                                                  );
                                                }),
                                        child: Card(
                                            child: Container(width: 50, height: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(photo.photoSrc!),
                                                      fit: BoxFit.cover),
                                                )
                                            )
                                        ),
                                      ),
                                    )
                                    ).toList()
                                  ),
                                  Row(
                                      children:controller.photos.map((photo) =>FadeInRight(
                                        child: GestureDetector(
                                          onLongPress: () =>
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0)), //this right here
                                                      child: Container(
                                                          height: 280,
                                                          width: 170,
                                                          child: Column(
                                                              children: [
                                                                Container(padding: EdgeInsets.only(top: 10), child: Text("Aperçu de la photo temporaire", style: TextStyle(fontSize: 14, color: Colors.primaries.last))),
                                                                Divider(color: Colors.grey[200]),
                                                                Container(width: 170, height: 170,
                                                                  decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: Image.file(File(photo.file.path)).image,
                                                                        fit: BoxFit.cover),
                                                                  ),
                                                                ),
                                                                Divider(color: Colors.grey[200]),
                                                                Row(
                                                                  children: [
                                                                    const BackButton(),
                                                                    const Expanded(child: Center()),
                                                                    IconButton(
                                                                      icon: const Icon(Icons.delete, color: Colors.red),
                                                                      tooltip: 'Supprimer',
                                                                      onPressed: () => controller.deletePhoto(photo.uiid),
                                                                    ),
                                                                  ],
                                                                ),

                                                              ])
                                                      )
                                                  );
                                                }),
                                          child: Card(
                                            child: Container(width: 50, height: 50,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: Image.file(File(photo.file.path)).image,
                                                  fit: BoxFit.cover),
                                              )
                                            )
                                          ),
                                        ),
                                      )
                                      ).toList()
                                  ),
                                  InkWell(
                                    onTap: () => controller.pickPhotosProduit(),
                                    child: Card(
                                      child: Container(
                                        width: 50, height: 50,
                                        child: Icon(EvaIcons.attach, color: Colors.blueGrey,)
                                      )
                                    ),
                                  ),
                                ]
                              ),
                        ),
                      ),
                    ),
                  ),
                ]),
                ),
                SizedBox(height: Get.height * 0.04),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child:
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => controller.isLoading.value ? null : controller.updateProduit(produit.produitId!),
                      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),),
                      icon: controller.isLoading.value ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                          : const Icon(Icons.update),
                      label: const Text('VALIDER'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
            ]),
              ),
            ),
            ]),
          ),
      )
    );

  }

}
