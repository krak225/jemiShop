import 'package:daily_task/app/features/dashboard/model/MyCommande.dart';
import 'package:daily_task/app/shared_components/build_liste_commandes.dart';
import 'package:daily_task/app/shared_components/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/bottom_sheet_user_details.dart';
import '../../../../shared_components/build_liste_clients.dart';
import '../../../../shared_components/form_add_commande.dart';
import '../../model/client.dart';

class ListeCommandes extends StatelessWidget {
  const ListeCommandes({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Future<List<MyCommande>> data;
  final Function(int index, Client data) onPressed;
  final Function(int index, Client data) onPressedAssign;
  final Function(int index, Client data) onPressedMember;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<MyCommande>>(
        future: data,
        builder: (context, snapshot) {
          print(snapshot);

          if (snapshot.hasData) {
            List<MyCommande>? clients = snapshot.data;

            print(clients);

            return Column(
                children: List.generate(
                  clients!.length, (index) =>
                    BuildListCommandes(client: clients[index],
                      onPressed: () => {},
                      onPressedAssign: () => onPressedAssign,
                      onPressedMember: () => {},
                    ),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUN CLIENT TROUVE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}
