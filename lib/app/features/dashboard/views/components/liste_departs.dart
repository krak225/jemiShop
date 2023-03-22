import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/build_liste_departs.dart';
import '../../../../shared_components/build_liste_produits.dart';
import '../../../../shared_components/build_liste_clients.dart';
import '../../../../shared_components/deails_produit.dart';
import '../../model/client.dart';
import '../../model/hellodepart_models.dart';
import '../../model/produit.dart';

class ListeDeparts extends StatelessWidget {
  const ListeDeparts({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Future<List<Depart>> data;
  final Function(int index, Client data) onPressed;
  final Function(int index, Client data) onPressedAssign;
  final Function(int index, Client data) onPressedMember;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Depart>>(
        future: data,
        builder: (context, snapshot) {

          print(snapshot);

          if (snapshot.hasData) {
            List<Depart>? departs = snapshot.data;

            return Column(
                children: List.generate(
                  departs!.length, (index) =>
                    BuildListDeparts(
                      depart: departs[index],
                      onPressed: () =>{
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {

                            return Center(child: Text(departs[index].toString()),);

                          }
                        )
                      },
                      onPressedAssign: () => {},
                      onPressedMember: () => {},
                    ),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUN DEPART TROUVE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}
