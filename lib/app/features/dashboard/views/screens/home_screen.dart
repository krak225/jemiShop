import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/header_text.dart';
import '../../../../shared_components/task_progress.dart';
import '../../controllers/home_controller.dart';
import '../components/header_weekly_task.dart';
import '../components/task_in_progress.dart';
import '../components/liste_clients.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: ScrollController(),
        child: _buildTaskContent(
          onPressedMenu: () => controller.openDrawer(),
        )
    );
  }

  Widget _buildTaskContent({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          /*const SizedBox(height: kSpacing),
          Row(
            children: [
              if (onPressedMenu != null)
                Padding(
                  padding: const EdgeInsets.only(right: kSpacing / 2),
                  child: IconButton(
                    onPressed: onPressedMenu,
                    icon: const Icon(Icons.menu),
                  ),
                ),
              Expanded(
                //child: SearchField(onSearch: controller.searchTask,hintText: "Rechercher une commande .. "),
                child: HeaderText("Tableau de bord"),
              ),
              Positioned(
                child: TextButton(
                  onPressed: () => {},
                  child:DottedBorder(
                    color: kFontColorPallets[3],
                    strokeWidth: .3,
                    strokeCap: StrokeCap.round,
                    borderType: BorderType.Circle,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/raster/man.png'),
                      backgroundColor: Colors.greenAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),*/
          const SizedBox(height: kSpacing),
          Row(
            children: [
              Expanded(
                child: HeaderText(
                  DateTime.now().formatdMMMMY(),
                ),
              ),
              const SizedBox(width: kSpacing / 2),
              SizedBox(
                width: 200,
                child: TaskProgress(data: controller.dataTask),
              ),
            ],
          ),
          const SizedBox(height: kSpacing),
          TaskInProgress(data: controller.taskInProgress),
          const SizedBox(height: kSpacing * 2),
          const HeaderWeeklyTask(),
          const SizedBox(height: kSpacing),
          ListeClients(
            data: controller.fetchClients(),
            onPressed: controller.onPressedTask,
            onPressedAssign: controller.onPressedAssignTask,
            onPressedMember: controller.onPressedMemberTask,
          )
        ],
      ),
    );
  }

}
