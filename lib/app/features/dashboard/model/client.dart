class Client{
  int? id;
  String? nom;
  String? prenoms;
  String? email;
  String? adresse;
  String? telephone;
  String? photo;
  String? date_creation;
  String? statut;

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

  Client.fromJson(Map<String, dynamic> json) {
    id = json['client_id'];
    nom = json['client_nom'];
    prenoms = json['client_prenoms'];
    photo = json['client_photo'];
    telephone = json['client_telephone'];
    email = json['client_email'];
    adresse = json['client_adresse'];
    date_creation = json['client_date_creation'];
    statut = json['client_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.id;
    data['client_nom'] = this.nom;
    data['client_prenoms'] = this.prenoms;
    data['client_photo'] = this.photo;
    data['client_telephone'] = this.telephone;
    data['client_email'] = this.email;
    data['client_adresse'] = this.adresse;
    data['client_date_creation'] = this.date_creation;
    data['client_statut'] = this.statut;
    return data;
  }
}