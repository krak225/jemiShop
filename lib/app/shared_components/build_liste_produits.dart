import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';

import '../features/dashboard/model/produit.dart';
import '../utils/stdfn.dart';

class BuildListProduits extends StatelessWidget {
  const BuildListProduits({
    required this.produit,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Produit produit;
  final Function() onPressed;
  final Function()? onPressedAssign;
  final Function()? onPressedMember;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onPressed,
      hoverColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      leading: _buildIcon(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      trailing: _buildAssign(),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: Image.network(produit.photo, fit: BoxFit.contain)//data.icon,
    );
  }

  Widget _buildTitle() {
    return Text(
      produit.nom,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      produit.categorie + " - en stock: " + produit.quantite_restante.toString(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign() {
    return Tooltip(
              message: produit.prix.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                child: Container(
                    //width: 50.0,
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    color: Colors.orange.withOpacity(.7),
                    child:Text(
                      Stdfn.toAmount(produit.prix),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                ),
              )
          );

  }
}
