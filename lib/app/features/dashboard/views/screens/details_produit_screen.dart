import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/form_add_produit.dart';
import '../../../../shared_components/header_text.dart';
import '../../controllers/home_controller.dart';
import '../components/ligne_horizontal.dart';
import '../components/liste_produits.dart';

class DetailsProduitScreen extends GetView<HomeController> {
  const DetailsProduitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: ScrollController(),
        child: _buildContent(
          onPressedMenu: () => controller.openDrawer(),
          context: context
        )
    );
  }

  Widget _buildContent({Function()? onPressedMenu, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  percent: 4 / 12,
                  progressColor: Colors.blueGrey,
                  backgroundColor: Colors.blueGrey[200],
                ),
              ),
            ],
          ),
          const SizedBox(height: kSpacing * 1),
          Row(
            children: [
              const HeaderText("Détails du produit"),
            ],
          ),
          const SizedBox(height: kSpacing),
          hero(),
        ],
      ),
    );
  }

  Widget hero(){
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset("images/shoe_blue.png",), //This
          // should be a paged
          // view.
          Positioned(child: FloatingActionButton(
              elevation: 2,
              child:Image.asset("images/heart_icon_disabled.png",
                width: 30,
                height: 30,),
              backgroundColor: Colors.white,
              onPressed: (){}
          ),
            bottom: 0,
            right: 20,
          ),

        ],
      ),
    );
  }

}
