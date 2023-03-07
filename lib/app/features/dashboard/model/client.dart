class Client{
  final int id;
  final String nom;
  final String prenoms;
  final String email;
  final String telephone;
  final String photo;
  final String created_at;

  Client({
    required this.id,
    required this.nom,
    required this.prenoms,
    required this.email,
    required this.telephone,
    required this.photo,
    required this.created_at,
  });

  factory Client.fromMap(Map<String, dynamic> json) => Client(
    id: json["id"],
    nom: json["name"].toString(),
    prenoms: json["prenoms"].toString(),
    email: json["email"].toString(),
    telephone: json["telephone"].toString(),
    photo: json["photo"].toString(),
    created_at: json["created_at"],
  );

}