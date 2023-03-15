import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_task/app/config/app_constants.dart';
import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:daily_task/app/features/dashboard/model/client.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constans/app_constants.dart';
import '../features/dashboard/controllers/home_controller.dart';
import '../features/dashboard/model/commande.dart';
import '../features/dashboard/model/produit.dart';
import '../utils/stdfn.dart';
import '../utils/ui/theme/custom_input_decoration.dart';
import '../utils/ui/theme/light_color.dart';
import '../utils/ui/theme/themes.dart';
import '../utils/validator_state.dart';

class FormAddCommande extends StatelessWidget {
  final DashboardController controller = Get.find();
  final HomeController hcontroller = Get.find();
  final Client client;

  FormAddCommande(this.client, {Key? key}) : super(key: key);

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
                        padding: EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    "Création d'une commande",
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
                                  SizedBox(height: 20),
                                  SizedBox(
                                    width: 0,
                                    height: 0,
                                    child: Column(children: [
                                      FadeInRight(
                                        child: FormBuilderTextField(
                                          name: 'client_id',
                                          initialValue: client.id.toString(),
                                          validator: ValidatorState.required,
                                          readOnly: true,
                                          decoration: CustomInputDecoration.style1(labelText: 'ID du client'),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  FadeInRight(
                                    child: FormBuilderTextField(
                                      name: 'client_nom',
                                      initialValue: client.nom! + " " + client.prenoms!,
                                      validator: ValidatorState.required,
                                      readOnly: true,
                                      decoration: CustomInputDecoration.style1(labelText: 'Nom du client'),
                                    ),
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
                                      FadeInRight(
                                        child:TextButton.icon(
                                          onPressed: ()=> showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.0)), //this right here
                                                    child: Container(
                                                        height: 255,
                                                        width: 170,
                                                        child: Column(
                                                            children: [
                                                              Container(padding: EdgeInsets.only(top: 10), child: Text("Produit commandé", style: TextStyle(fontSize: 14, color: Colors.primaries.last))),
                                                              Divider(color: Colors.grey[200]),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                                                                child: FormBuilder(
                                                                  key: controller.formKey2,
                                                                  autovalidateMode: AutovalidateMode.disabled,
                                                                  child: Column(children: [
                                                                    SizedBox(height: 10),
                                                                    SizedBox(
                                                                      width: 0,
                                                                      height: 0,
                                                                      child: Column(children: [
                                                                        FadeInRight(
                                                                          child: FormBuilderTextField(
                                                                            name: 'client_id',
                                                                            initialValue: client.id.toString(),
                                                                            validator: ValidatorState.required,
                                                                            readOnly: true,
                                                                            decoration: CustomInputDecoration.style1(labelText: 'ID du client'),
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                    ),
                                                                    FadeInRight(
                                                                      child: FormBuilderDropdown(
                                                                          name: 'produit',
                                                                          validator: ValidatorState.required,
                                                                          decoration: CustomInputDecoration.style1(labelText: 'Produit'),
                                                                          items: hcontroller.produits.map((produit) => DropdownMenuItem(
                                                                            child: Text(produit.produitNom! + " - PU: " + produit.produitPrix.toString()+"F"),
                                                                            value: produit.produitId.toString(),
                                                                          ),
                                                                          ).toList()
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: Get.height * 0.02),
                                                                    FadeInRight(
                                                                      child: FormBuilderTextField(
                                                                        name: 'quantite',
                                                                        initialValue: '1',
                                                                        validator: ValidatorState.required,
                                                                        keyboardType: TextInputType.number,
                                                                        decoration: CustomInputDecoration.style1(labelText: 'Quantité'),
                                                                      ),
                                                                    ),

                                                                  ]),
                                                                ),
                                                              ),
                                                              Divider(color: Colors.grey[200]),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                child: Row(
                                                                  children: [
                                                                    BackButton(color: Colors.grey, ),
                                                                    const Expanded(child: Center()),
                                                                    TextButton.icon(
                                                                      icon: const Icon(EvaIcons.saveOutline),
                                                                      label: Text('Ajouter'),
                                                                      onPressed: () => controller.addProduitCommande(),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                            ])
                                                    )
                                                );
                                              }),
                                          icon: Icon(EvaIcons.plusCircle, size: 24.0, color: Colors.orange),
                                          label: Text('Ajouter', style: TextStyle(color: Colors.orange),),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.height * 0.02),
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
                                        child: Column(children: controller.produits_commandes.where((pc) => pc.client_id == client.id).map((commande) =>FadeInRight(
                                            child: ListTile(
                                              leading: _buildIcon(commande.produit),
                                              title: Text(commande.produit.produitNom!,style: const TextStyle(fontWeight: FontWeight.normal), maxLines: 1,overflow: TextOverflow.ellipsis),
                                              subtitle: Text("quantié : "+commande.quantite.toString() ,maxLines: 1, overflow: TextOverflow.ellipsis),
                                              trailing: _buildAssign(commande),
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
                              SizedBox(height: Get.height * 0.04),
                              FadeInRight(
                                duration: Duration(milliseconds: 600),
                                child:
                                Center(
                                  child: ElevatedButton.icon(
                                    onPressed: () => controller.isLoading.value ? null : controller.saveCommande(),
                                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), backgroundColor: null),
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
                                    label: const Text('CONFIRMER'),
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
          ),
        ])
    );

  }


  Widget _buildIcon(Produit produit) {

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: FadeInImage(
        fadeInDuration: const Duration(milliseconds: 1),
        image:NetworkImage(AppConstants.PRODUCTS_URL+produit.produitPhotoPrincipale!),
        placeholder: const AssetImage('assets/icons/user_.png'),
        imageErrorBuilder:(context, error, stackTrace) {
          return Icon(EvaIcons.person);
        },
        fit: BoxFit.contain,
      ),
    );
  }


  Widget _buildAssign(Commande commande) {
    return Tooltip(
        message: commande.produit.produitPrix.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: Colors.green.withOpacity(.7),
            child:Text(
              Stdfn.toAmount(commande.produit.produitPrix! * commande.quantite),
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
    var produits_commandes =  controller.produits_commandes.where((pc) => pc.client_id == client.id);
    int total_commande = 0;
    for(var pc in produits_commandes){
      total_commande+= pc.quantite * int.parse(pc.produit.produitPrix.toString());
    }

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
                Stdfn.toAmount(total_commande),
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
