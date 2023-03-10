class Produit{
  final int id;
  final String nom;
  final String photo;
  final String categorie;
  final int prix;
  final int quantite_total;
  final int quantite_achete;
  final int quantite_restante;
  final String date_creation;

  Produit({
    required this.id,
    required this.nom,
    required this.photo,
    required this.categorie,
    required this.prix,
    required this.quantite_total,
    required this.quantite_achete,
    required this.quantite_restante,
    required this.date_creation
  });

  factory Produit.fromMap(Map<String, dynamic> json) => Produit(
    id: json["produit_id"],
    nom: json["produit_nom"],
    photo: json["produit_photo_principale"],
    categorie: json["categorie_nom"],
    prix: int.parse(json["produit_prix"]),
    quantite_total: int.parse(json["produit_quantite_total"]),
    quantite_achete: int.parse(json["produit_quantite_achete"]),
    quantite_restante: int.parse(json["produit_quantite_restante"]),
    date_creation: json["produit_date_creation"],
  );

}