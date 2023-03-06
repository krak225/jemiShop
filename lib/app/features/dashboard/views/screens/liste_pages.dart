
import 'package:daily_task/app/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/dashboard_controller.dart';

class AccueilPage extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:EdgeInsets.symmetric(vertical: 50),
        child: Center(child: Text("Home Page", style: Theme.of(context).textTheme.headline3)
      )
    );

  }
}

class ProduitsPage extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {

    return Container(
        padding:EdgeInsets.symmetric(vertical: 50),
        child: Center(child: Text("Produits Page", style: Theme.of(context).textTheme.headline3)
        )
    );

  }
}

class ClientsPage extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {

    return Container(
        padding:EdgeInsets.symmetric(vertical: 50),
        child: Center(child: Text("Clients Page", style: Theme.of(context).textTheme.headline3)
        )
    );

  }
}

class CommandesPage extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {

    return Container(
        padding:EdgeInsets.symmetric(vertical: 50),
        child: Center(child: Text("Commande Page", style: Theme.of(context).textTheme.headline3)
        )
    );

  }
}
