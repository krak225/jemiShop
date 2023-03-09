import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_task/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../utils/ui/theme/custom_input_decoration.dart';

class FormAddProduit extends StatelessWidget {
  final DashboardController controller = Get.find();

  FormAddProduit();

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
                  height: 100,
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
                    "Création d'un produit",
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
                      decoration: CustomInputDecoration.style1(labelText: 'Nom du prduit'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'prix',
                      initialValue: '',
                      //validator: FormBuilderValidators.numeric(),
                      decoration: CustomInputDecoration.style1(labelText: 'Prix'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderDropdown(
                      name: 'categorie',
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
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'stock',
                      initialValue: '',
                      decoration:
                      CustomInputDecoration.style1(labelText: 'Stock disponible'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  FadeInRight(
                    child: FormBuilderTextField(
                      name: 'description',
                      initialValue: '',
                      // validator: ValidatorState.email,
                      decoration: CustomInputDecoration.style1(labelText: 'Description'),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text("Joindres des photos"),
                  FadeInRight(
                    child: Obx(() =>Row(
                          children: [
                            InkWell(
                              onTap: () => controller.pickPhotoProduit(1),
                              child: Card(
                                child: Icon(
                                  Icons.image,
                                  color: controller.has_photo1.value ? Colors.green : Colors.grey,
                                  size: 80.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () => controller.pickPhotoProduit(2),
                              child: Card(
                                child: Icon(
                                  Icons.image,
                                  color: controller.has_photo2.value ? Colors.green : Colors.grey,
                                  size: 80.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: () => controller.pickPhotoProduit(3),
                              child: Card(
                                child: Icon(
                                  Icons.image,
                                  color: controller.has_photo3.value ? Colors.green : Colors.grey,
                                  size: 80.0,
                                ),
                              ),
                            )
                          ],
                        ),
                    ),
                  ),
                  /*
                  FadeInRight(
                    child: FormBuilderFilePicker(
                      name: "images",
                      decoration: InputDecoration(labelText: "Photos"),
                      maxFiles: 2,
                      previewImages: true,
                      onChanged: (val) => print(val),
                      selector: Row(
                        children: <Widget>[
                          Icon(Icons.image),
                          Icon(Icons.image),
                        ],
                      ),
                      onFileLoading: (val) {
                        print(val);
                      },
                    ),
                  ),*/
                ]),
                ),
                SizedBox(height: Get.height * 0.04),
                FadeInRight(
                  duration: Duration(milliseconds: 600),
                  child:
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => controller.isLoading.value ? null : controller.saveProduit(),
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
