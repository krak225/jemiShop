import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/ui/theme/custom_input_decoration.dart';

class FormAddCommande extends StatelessWidget {
  final DashboardController controller = Get.find();

  FormAddCommande();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32), ),
          child:
          Container(
            color: Colors.white,
            child: Column(
            children: [
              //Text(""),
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
                  height: 150,
                  child: Container(
                    alignment: Alignment(0.0,2.5),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 65.0,
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.teal,
                        size: 56.0,
                      ),
                    ),
                  ),
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
                    "Nouvelle commande",
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
                      name: 'client',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration: CustomInputDecoration.style1(labelText: 'Nom du client'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'total',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration: CustomInputDecoration.style1(labelText: 'Montant Total'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'produit',
                      initialValue: '',
                      decoration:
                      CustomInputDecoration.style1(labelText: 'Produits'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'description',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration: CustomInputDecoration.style1(labelText: 'Détails'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderDateTimePicker(
                      name: 'date',
                      initialDate: DateTime.now(),
                      format: DateFormat('dd/MM/yyyy'),
                      decoration: CustomInputDecoration.style1(labelText: "Date de la commande"),
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
                      onPressed: () => controller.isLoading.value ? null : controller.saveCommande(),
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
                          : const Icon(Icons.check),
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
