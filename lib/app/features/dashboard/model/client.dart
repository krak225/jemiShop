class Client{
  final int id;
  final String nom;
  final String prenoms;
  final String email;
  final String adresse;
  final String telephone;
  final String photo;
  final String date_creation;

  Client({
    required this.id,
    required this.nom,
    required this.prenoms,
    required this.photo,
    required this.telephone,
    required this.email,
    required this.adresse,
    required this.date_creation,
  });

  factory Client.fromMap(Map<String, dynamic> json) => Client(
    id: json["client_id"],
    nom: json["client_nom"].toString(),
    prenoms: json["client_prenoms"].toString(),
    photo: json["client_photo"].toString(),
    telephone: json["client_telephone"].toString(),
    email: json["client_email"].toString(),
    adresse: json["client_adresse"].toString(),
    date_creation: json["client_date_creation"],
  );

}