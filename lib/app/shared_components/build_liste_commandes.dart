import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/features/dashboard/model/MyCommande.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../utils/stdfn.dart';

class BuildListCommandes extends StatelessWidget {
  const BuildListCommandes({
    required this.commande,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final MyCommande commande;
  final Function() onPressed;

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
      trailing: _buildMontantTotal(),
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
      child: Icon(EvaIcons.creditCard),
    );
  }

  Widget _buildTitle() {
    return Text(
      commande!.client!.nom.toString() + " " + commande!.client!.prenoms.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text("N°" + commande.commandeId.toString() + " du " + Stdfn.dateFromDB(commande.commandeDateCreation!),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMontantTotal() {

    print (commande.commandeMontantTotal.toString());
    return Tooltip(
        message: commande.commandeMontantTotal.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: Colors.orange.withOpacity(.7),
            child:Text(
              Stdfn.toAmount(int.parse(commande.commandeMontantTotal.toString())),
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
