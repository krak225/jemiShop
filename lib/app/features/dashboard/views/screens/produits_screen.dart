import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/header_text.dart';
import '../../controllers/home_controller.dart';
import '../components/ligne_horizontal.dart';
import '../components/weekly_task.dart';

class ProduitsScreen extends GetView<HomeController> {
  const ProduitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: ScrollController(),
        child: _buildContent(
          onPressedMenu: () => controller.openDrawer(),
        )
    );
  }

  Widget _buildContent({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              Expanded(
                child: LigneHorizontale(data: LigneHorizontaleData(title:"", totalTask: 12, totalCompleted: 4)),
              ),
            ],
          ),
          const SizedBox(height: kSpacing * 1),
          Row(
            children: [
              const HeaderText("Mes produits"),
              const Spacer(),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                icon: const Icon(
                  EvaIcons.plus,
                  size: 16,
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                label: const Text("Nouveau"),
              ),
            ],
          ),
          const SizedBox(height: kSpacing),
          WeeklyTask(
            data: controller.weeklyTask,
            onPressed: controller.onPressedTask,
            onPressedAssign: controller.onPressedAssignTask,
            onPressedMember: controller.onPressedMemberTask,
          )
        ],
      ),
    );
  }

}
