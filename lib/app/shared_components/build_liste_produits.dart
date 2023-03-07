import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../features/dashboard/model/produit.dart';

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
      produit.categorie + " - " + produit.date_creation,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign() {
    return Tooltip(
              message: produit.prix.toString(),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.orange.withOpacity(.1),
                child: Text(
                  produit.prix.toString().toUpperCase(),
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          );
  }
}
