import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/features/dashboard/model/MyCommande.dart';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../features/dashboard/model/client.dart';
import '../utils/stdfn.dart';

class BuildListCommandes extends StatelessWidget {
  const BuildListCommandes({
    required this.client,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final MyCommande client;
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
      child: FadeInImage(
        fadeInDuration: const Duration(milliseconds: 1),
        image:NetworkImage("client.produitCommande?.first.produitPhotoPrincipale"),
        placeholder: const AssetImage('assets/icons/user_.png'),
        imageErrorBuilder:(context, error, stackTrace) {
          return Icon(EvaIcons.creditCard);
        },
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Commande N°" + client.commandeId.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    String edit = "";

    return Text(
      "Date: " + client.commandeDateCreation.toString(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign() {
    return Tooltip(
        message: client.commandeMontantTotal.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: Colors.orange.withOpacity(.7),
            child:Text(
              Stdfn.toAmount(int.parse(client.commandeMontantTotal!)),
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
