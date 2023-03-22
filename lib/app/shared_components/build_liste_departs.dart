import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';

import '../config/app_constants.dart';
import '../features/dashboard/model/hellodepart_models.dart';
import '../features/dashboard/model/produit.dart';
import '../utils/stdfn.dart';

class BuildListDeparts extends StatelessWidget {
  const BuildListDeparts({
    required this.depart,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Depart depart;
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
      child: Image.network(AppConstants.BASE_URL+depart!.compagnie!.compagnieLogo!, fit: BoxFit.contain)//data.icon,
    );
  }

  Widget _buildTitle() {
    return Text(
      "Départ N° "+ depart.departId.toString() + ": " + depart.ligne!.ligneDesignation!,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      depart.compagnie!.compagnieDesignation!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign() {
    return Tooltip(
              message: depart.ligne!.ligneKilometrage!,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                child: Container(
                    //width: 50.0,
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    color: Colors.orange.withOpacity(.7),
                    child:Text(
                      Stdfn.toAmount(int.parse(depart!.ligne!.ligneKilometrage!)),
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
