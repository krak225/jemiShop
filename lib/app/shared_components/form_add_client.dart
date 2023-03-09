import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../features/dashboard/views/components/ligne_horizontal.dart';
import '../utils/ui/theme/custom_input_decoration.dart';
import '../utils/ui/theme/light_color.dart';
import '../utils/validator_state.dart';

class FormAddClientBottomSheet extends StatelessWidget {
  final DashboardController controller = Get.find();

  FormAddClientBottomSheet();

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
                        Icons.person_add,
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
                    "Création d'un client",
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
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration: CustomInputDecoration.style1(labelText: 'Nom'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'prenoms',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration: CustomInputDecoration.style1(labelText: 'Prenoms'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'telephone',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration:
                      CustomInputDecoration.style1(labelText: 'Téléphone'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'email',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration:
                      CustomInputDecoration.style1(labelText: 'Email'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'adresse',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration: CustomInputDecoration.style1(labelText: 'Adresse de livraison'),
                    ),
                  ),
                  /*
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: FadeInRight(
                          child: FormBuilderDropdown(
                            name: 'sexe',
                            validator: ValidatorState.required,
                            decoration: CustomInputDecoration.style2(labelText: 'Sexe'),
                            items: [
                              DropdownMenuItem(
                                child: Text('Femme'),
                                value: '2',
                              ),
                              DropdownMenuItem(
                                child: Text('Homme'),
                                value: '3',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                  width: 20,
                  ),
                  Expanded(
                    child: FadeInRight(
                      child: FormBuilderTextField(
                        name: 'experience',
                        initialValue: '',
                        // validator: ValidatorState.email,
                        decoration: CustomInputDecoration.style1(
                        labelText: "Année d'expérience"),
                      ),
                    ),
                  ),
                    ],
                  ),*/
                  /*SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    delay: Duration(milliseconds: 300),
                    child: FormBuilderTextField(
                      name: 'password',
                      initialValue: '',
                      obscureText: controller.isHide.value,
                      validator: ValidatorState.required,
                      decoration: CustomInputDecoration.style1(
                        labelText: 'Mot de passe',
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            controller.isHide.value = !controller.isHide.value;
                          },
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    delay: Duration(milliseconds: 300),
                    child: FormBuilderTextField(
                      name: 'password_confirmation',
                      initialValue: '',
                      obscureText: controller.isHide.value,
                      validator: ValidatorState.required,
                      decoration: CustomInputDecoration.style1(
                      labelText: 'Confirmez le mot de passe',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.isHide2.value =!controller.isHide2.value;
                        },
                      )),
                    ),
                  ),*/
                  SizedBox(height: Get.height * 0.02),
                ]),
                ),
                SizedBox(height: Get.height * 0.04),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child:
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => controller.isLoading.value ? null : controller.saveClient(),
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
                      label: const Text('ENREGISTRER LE CLIENT'),
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
