import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/build_liste_produits.dart';
import '../../../../shared_components/build_liste_clients.dart';
import '../../../../shared_components/deails_produit.dart';
import '../../model/client.dart';
import '../../model/produit.dart';

class ListeProduits extends StatelessWidget {
  const ListeProduits({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Future<List<Produit>> data;
  final Function(int index, Client data) onPressed;
  final Function(int index, Client data) onPressedAssign;
  final Function(int index, Client data) onPressedMember;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Produit>>(
        future: data,
        builder: (context, snapshot) {

          print(snapshot);

          if (snapshot.hasData) {
            List<Produit>? produits = snapshot.data;

            return Column(
                children: List.generate(
                  produits!.length, (index) =>
                    BuildListProduits(
                      produit: produits[index],
                      onPressed: () =>{
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {

                            return DetailsProduit(produits[index]);

                          }
                        )
                      },
                      onPressedAssign: () => {},
                      onPressedMember: () => {},
                    ),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUN PRODUIT TROUVE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}
