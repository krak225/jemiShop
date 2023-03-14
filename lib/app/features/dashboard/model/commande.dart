import 'package:daily_task/app/features/dashboard/model/produit.dart';

class Commande{
  final id;
  final client_id;
  final Produit produit;
  final int quantite;

  Commande({
    required this.id,
    required this.client_id,
    required this.produit,
    required this.quantite,
  });

  factory Commande.fromMap(Map<String, dynamic> json) => Commande(
    id: json["id"],
    client_id: json["client_id"],
    produit: json["produit_id"],
    quantite: json["quantite"],
  );


}