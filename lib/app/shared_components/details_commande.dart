import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:daily_task/app/features/dashboard/model/MyCommande.dart';
import 'package:daily_task/app/features/dashboard/model/client.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../config/app_constants.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/controllers/home_controller.dart';
import '../features/dashboard/model/commande.dart';
import '../features/dashboard/model/produit.dart';
import '../utils/stdfn.dart';
import '../utils/ui/theme/custom_input_decoration.dart';
import '../utils/ui/theme/light_color.dart';
import '../utils/ui/theme/themes.dart';
import '../utils/validator_state.dart';

class DetailsCommande extends StatelessWidget {
  final DashboardController controller = Get.find();
  final HomeController hcontroller = Get.find();
  final MyCommande mycommande;

  DetailsCommande(this.mycommande, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15,
            width: 120,
            child:LinearPercentIndicator(
              percent: 1 / 1,
              progressColor: Colors.white70,
              //backgroundColor: Colors.blueGrey[200],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12), ),
            child:
            Container(
              color: Colors.white,
              child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    "Commande N°" + mycommande!.commandeId.toString() ,
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
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Obx(()=>Column(children: [
                                  Center(child: controller.isLoading.value? null : null),//juste pour pouvoir utiliser obx en attentant de voir
                                  SizedBox(height: 20),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Date de la commande : ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: FadeInRight(
                                              child: Text(Stdfn.dateFromDB(mycommande!.commandeDateCreation!), textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Nom du client: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                          child:Text(mycommande!.client!.nom! + " " + mycommande!.client!.prenoms!, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  FadeInRight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FadeInRight(
                                            child: Text("Statut de la commande: ", style:TextStyle(fontSize: 12),),
                                          ),
                                        ),
                                        Expanded(
                                            child:Text(mycommande!.commandeStatutLivraison! == "EFFECTUEE" ? "PAYE" : "EN ATTENTE", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold),)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.grey[100],),
                                  SizedBox(height: Get.height * 0.01),
                                  SizedBox(
                                    width: 0,
                                    height: 0,
                                    child: Column(children: [
                                      FadeInRight(
                                        child: FormBuilderTextField(
                                          name: 'client_id',
                                          initialValue: mycommande!.client!.id.toString(),
                                          validator: ValidatorState.required,
                                          readOnly: true,
                                          decoration: CustomInputDecoration.style1(labelText: 'ID du client'),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(height: Get.height * 0.02),
                                  Row(
                                    children: [
                                      FadeInRight(
                                          child:Text("Liste des produits commandés",
                                            style: Themes.globalFont(style: TextStyle(color: LightColor.black, fontSize: 12)),
                                            textAlign: TextAlign.left,
                                          )
                                      ),
                                    ],
                                  ),
                                  FadeInRight(
                                    child: Divider(height: 4, color: Colors.orange,),
                                  ),
                                  SizedBox(height: Get.height * 0.01),
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
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(children: mycommande!.produitCommande!.map((pc) =>FadeInRight(
                                            child: ListTile(
                                              leading: _buildIcon(pc.produitPhotoPrincipale!),
                                              title: Text(pc.produitNom!,style: const TextStyle(fontWeight: FontWeight.normal), maxLines: 1,overflow: TextOverflow.ellipsis),
                                              subtitle: Text("quantié : "+pc.quantite.toString() ,maxLines: 1, overflow: TextOverflow.ellipsis),
                                              trailing: _buildAssign(int.parse(pc!.total.toString())),
                                              hoverColor: Colors.orange,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(kBorderRadius),
                                              ),
                                            )
                                        )
                                        ).toList()
                                        ),
                                      ),
                                    ),
                                  ),
                                  FadeInRight(
                                    child: _buildTotalCommande(),
                                  ),
                                ]),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Divider(),
                    Container(padding: EdgeInsets.symmetric(horizontal: 0),
                      child: mycommande.commandeStatutLivraison!.contains('NON EFFECTUEE') ?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(children:[
                          FadeInRight(
                              child:Text("La commande a-t-elle été réglée ou annulée ?",
                                style: Themes.globalFont(style: TextStyle(color: LightColor.black, fontSize: 12)),
                                textAlign: TextAlign.left,
                              )
                          ),
                          FadeInRight(
                            duration: Duration(milliseconds: 600),
                            child: Row(children:[
                              SizedBox(child:
                              ElevatedButton.icon(
                                onPressed: () => controller.updateStatutCommande(mycommande.commandeId!, 'ANNULEE'),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.red[400], padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)) ,
                                icon: controller.isLoading.value ? Container(
                                  width: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                                    : const Icon(Icons.delete),
                                label: const Text('ANNULEE'),
                              ),
                              ),
                              Expanded(child: Center(child: Text("")),),
                              SizedBox(child: 
                              ElevatedButton.icon(
                                onPressed: () => controller.updateStatutCommande(mycommande.commandeId!, 'EFFECTUEE'),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),),
                                icon: controller.isLoading.value ? Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                )
                                    : const Icon(Icons.check),
                                label: const Text('REGLEE'),
                              ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                      )
                      : Center(),
                    )
            ]),
          ),
          ),
        ])
    );

  }


  Widget _buildIcon(String photo_url) {

    print(photo_url);

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: FadeInImage(
        fadeInDuration: const Duration(milliseconds: 1),
        image:NetworkImage(AppConstants.PRODUCTS_URL + photo_url),
        placeholder: const AssetImage('assets/icons/user_.png'),
        imageErrorBuilder:(context, error, stackTrace) {
          return Icon(EvaIcons.person);
        },
        fit: BoxFit.contain,
      ),
    );
  }


  Widget _buildAssign(int total) {
    return Tooltip(
        message: total.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: Colors.green.withOpacity(.7),
            child:Text(
              Stdfn.toAmount(total),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        )
    );

  }

  Widget _buildTotalCommande() {

    return ListTile(
      leading: null,
      title: Text("Montant total",style: const TextStyle(fontWeight: FontWeight.normal), maxLines: 1,overflow: TextOverflow.ellipsis),
      trailing: Tooltip(
          message: "Montant total",
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              color: Colors.orange.withOpacity(.7),
              child:Text(
                Stdfn.toAmount(int.parse(mycommande!.commandeMontantTotal.toString())),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          )
      ),
      hoverColor: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
    );
  }
}
