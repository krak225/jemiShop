import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/shared_components/header_text.dart';
import 'package:daily_task/app/shared_components/responsive_builder.dart';
import 'package:daily_task/app/shared_components/task_progress.dart';
import 'package:daily_task/app/shared_components/user_profile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../controllers/dashboard_controller.dart';
import '../components/bottom_navbar.dart';
import '../components/header_weekly_task.dart';
import '../components/main_menu.dart';
import '../components/task_group.dart';
import '../components/task_in_progress.dart';
import '../components/task_menu.dart';
import '../components/weekly_task.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          controller.closeAppConfirm();
          return false;
        },
      child: Scaffold(
        key: controller.scafoldKey,
        appBar: AppBar(title: Text('Jemi Shop - Tableau de bord'),),
        drawer: ResponsiveBuilder.isDesktop(context)
            ? null
            : Drawer(
                child: SafeArea(
                  child: SingleChildScrollView(child: _buildSidebar(context)),
                ),
              ),
        bottomNavigationBar: (ResponsiveBuilder.isDesktop(context) || kIsWeb)
            ? null
            : const BottomNavbar(),
        body: SafeArea(
              child: ResponsiveBuilder(
                mobileBuilder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*const SizedBox(height: kSpacing),
                          Row(
                            children: [

                                Padding(
                                  padding: const EdgeInsets.only(right: kSpacing / 2),
                                  child: IconButton(
                                    onPressed: ()=> {},
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
                          ),
                          */
                          controller.pageList[controller.tabIndex.value]
                        ],
                      )
                    )
                  );
                },
                tabletBuilder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: constraints.maxWidth > 800 ? 8 : 7,
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: _buildTaskContent(
                            onPressedMenu: () => controller.openDrawer(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const VerticalDivider(),
                      ),
                      Flexible(
                        flex: 4,
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: Obx(() => Column(
                            children: [
                              controller.pageList[controller.tabIndex.value]
                            ],
                          )),
                        ),
                      ),
                    ],
                  );
                },
                desktopBuilder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: constraints.maxWidth > 1350 ? 3 : 4,
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: _buildSidebar(context),
                        ),
                      ),
                      Flexible(
                        flex: constraints.maxWidth > 1350 ? 10 : 9,
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: Obx(() => Column(
                            children: [
                              controller.pageList[controller.tabIndex.value]
                            ],
                          )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const VerticalDivider(),
                      ),
                      Flexible(
                        flex: 4,
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: _buildCalendarContent(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UserProfile(
            data: controller.dataProfil,
            onPressed: controller.onPressedProfil,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MainMenu(onSelected: controller.onSelectedMainMenu),
        ),
        const Divider(
          indent: 20,
          thickness: 1,
          endIndent: 20,
          height: 60,
        ),
        //_Member(member: controller.member),
        const SizedBox(height: kSpacing),
        TaskMenu(
          onSelected: controller.onSelectedTaskMenu,
        ),
        const SizedBox(height: kSpacing),
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Text(
            "© 2023 JemiShop | Design by krak225",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskContent({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
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
          ),
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

  Widget _buildCalendarContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              const Expanded(child: HeaderText("Mon agenda")),
              IconButton(
                onPressed: controller.onPressedCalendar,
                icon: const Icon(EvaIcons.calendarOutline),
                tooltip: "calendar",
              )
            ],
          ),
          const SizedBox(height: kSpacing),
          ...controller.taskGroup
              .map(
                (e) => TaskGroup(
                  title: DateFormat('d MMMM').format(e[0].date),
                  data: e,
                  onPressed: controller.onPressedTaskGroup,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
