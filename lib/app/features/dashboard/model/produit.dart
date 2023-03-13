import 'package:daily_task/app/features/dashboard/model/photo.dart';

class Produit {
  int? produitId;
  String? categorieId;
  String? produitNom;
  String? produitPhotoPrincipale;
  int? produitPrix;
  int? produitQuantiteTotal;
  int? produitQuantiteAchete;
  int? produitQuantiteRestante;
  String? produitDateCreation;
  String? categorieNom;
  List<Photo>? photo;

  Produit(
      {this.produitId,
        this.categorieId,
        this.produitNom,
        this.produitPhotoPrincipale,
        this.produitPrix,
        this.produitQuantiteTotal,
        this.produitQuantiteAchete,
        this.produitQuantiteRestante,
        this.produitDateCreation,
        this.categorieNom,
        this.photo});

  Produit.fromJson(Map<String, dynamic> json) {
    produitId = json['produit_id'];
    categorieId = json['categorie_id'];
    produitNom = json['produit_nom'];
    produitPhotoPrincipale = json['produit_photo_principale'];
    produitPrix = int.parse(json['produit_prix']);
    produitQuantiteTotal = int.parse(json['produit_quantite_total']);
    produitQuantiteAchete = int.parse(json['produit_quantite_achete']);
    produitQuantiteRestante = int.parse(json['produit_quantite_restante']);
    produitDateCreation = json['produit_date_creation'];
    categorieNom = json['categorie_nom'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo?.add(new Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['produit_id'] = this.produitId;
    data['categorie_id'] = this.categorieId;
    data['produit_nom'] = this.produitNom;
    data['produit_photo_principale'] = this.produitPhotoPrincipale;
    data['produit_prix'] = this.produitPrix;
    data['produit_quantite_total'] = this.produitQuantiteTotal;
    data['produit_quantite_achete'] = this.produitQuantiteAchete;
    data['produit_quantite_restante'] = this.produitQuantiteRestante;
    data['produit_date_creation'] = this.produitDateCreation;
    data['categorie_nom'] = this.categorieNom;
    final photo = this.photo;
    if (photo != null) {
      data['photo'] = photo.map((v) => v.toJson()).toList();
    }
    return data;
  }

}