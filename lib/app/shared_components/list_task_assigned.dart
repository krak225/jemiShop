import 'package:daily_task/app/constans/app_constants.dart';
import 'package:daily_task/app/utils/helpers/app_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../features/dashboard/Models/client.dart';

class BuildListClients extends StatelessWidget {
  const BuildListClients({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Comment data;
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
      child: Icon(Icons.person)//data.icon,
    );
  }

  Widget _buildTitle() {
    return Text(
      data.offretitre,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    String edit = "";

    if (data.offre_datefin != null) {
      edit = " \u2022  ${data.offre_datefin}";//" \u2022  ${timeago.format(data.experience!)}";
    }

    return Text(
      data.diplome + edit,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign() {
    return (data.offretitre != null)
        ? InkWell(
            onTap: onPressedMember,
            borderRadius: BorderRadius.circular(22),
            child: Tooltip(
              message: data.offretitre!,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.orange.withOpacity(.2),
                child: Text(
                  data.offrenombreposte.toString()!.getInitialName(2).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        : DottedBorder(
            color: kFontColorPallets[1],
            strokeWidth: .3,
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            child: IconButton(
              onPressed: onPressedAssign,
              color: kFontColorPallets[1],
              iconSize: 15,
              icon: const Icon(EvaIcons.plus),
              splashRadius: 24,
              tooltip: "assign",
            ),
          );
  }
}
