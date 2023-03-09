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
    id: json["id"],
    nom: json["nom"],
    photo: json["photo"],
    categorie: json["categorie"],
    prix: int.parse(json["prix"]),
    quantite_total: int.parse(json["quantite_total"]),
    quantite_achete: int.parse(json["quantite_achete"]),
    quantite_restante: int.parse(json["quantite_restante"]),
    date_creation: json["date_creation"],
  );

}