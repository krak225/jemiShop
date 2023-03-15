import 'package:daily_task/app/config/app_constants.dart';
import 'package:daily_task/app/constans/app_constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../features/dashboard/model/client.dart';

class BuildListClients extends StatelessWidget {
  const BuildListClients({
    required this.client,
    required this.onPressed,
    required this.onPressedNewCommande,
    Key? key,
  }) : super(key: key);

  final Client client;
  final Function() onPressed;
  final Function()? onPressedNewCommande;

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
      trailing: _buildButtonNewCommande(),
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
        image:NetworkImage(AppConstants.CLIENTS_URL+client.photo!),
        placeholder: const AssetImage('assets/icons/user_.png'),
        imageErrorBuilder:(context, error, stackTrace) {
          return Icon(EvaIcons.person);
        },
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      client.nom! + " " + client.prenoms!,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    String edit = "";

    if (client.telephone != null) {
      edit = " \u2022  ${client.email}";//" \u2022  ${timeago.format(data.experience!)}";
    }

    return Text(
      client.telephone! + edit,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildButtonNewCommande() {

    return InkWell(
            onTap: onPressedNewCommande,
            borderRadius: BorderRadius.circular(22),
            child: Tooltip(
              message: "",
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.orange.withOpacity(.2),
                child: Icon(EvaIcons.fileAdd),
                ),
              ),
          );

    return DottedBorder(
            color: kFontColorPallets[1],
            strokeWidth: .3,
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            child: IconButton(
              onPressed: onPressedNewCommande,
              color: kFontColorPallets[1],
              iconSize: 15,
              icon: const Icon(EvaIcons.plus),
              splashRadius: 24,
              tooltip: "assign",
            ),
          );
  }
}
