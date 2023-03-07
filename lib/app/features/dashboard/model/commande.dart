import 'package:daily_task/app/features/dashboard/model/produit.dart';

class Commande{
  final int id;
  final Produit produit;
  final int quantite;

  Commande({
    required this.id,
    required this.produit,
    required this.quantite,
  });

  factory Commande.fromMap(Map<String, dynamic> json) => Commande(
    id: json["offre_id"],
    produit: json["offrenombreposte"],
    quantite: json["offretitre"],
  );


}