import 'package:daily_task/app/features/dashboard/model/MyCommande.dart';
import 'package:daily_task/app/shared_components/build_liste_commandes.dart';
import 'package:daily_task/app/shared_components/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/bottom_sheet_user_details.dart';
import '../../../../shared_components/build_liste_clients.dart';
import '../../../../shared_components/details_commande.dart';
import '../../../../shared_components/form_add_commande.dart';
import '../../model/client.dart';

class ListeCommandes extends StatelessWidget {
  const ListeCommandes({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Future<List<MyCommande>> data;
  final Function(int index, Client data) onPressed;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<MyCommande>>(
        future: data,
        builder: (context, snapshot) {
          print(snapshot);

          if (snapshot.hasData) {
            List<MyCommande>? commandes = snapshot.data;

            print(commandes!.length);

            return Column(
                children: List.generate(
                  commandes!.length, (index) =>
                    BuildListCommandes(commande: commandes[index],
                      onPressed: () => {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {

                              return DetailsCommande(commandes[index]);

                            }
                        )
                      },
                    ),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUNE COMMANDE TROUVE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}
