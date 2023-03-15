import 'package:daily_task/app/features/dashboard/model/client.dart';

class MyCommande {
  int? commandeId;
  String? clientId;
  String? commandeMontantTotal;
  Null? commandeNombreProduit;
  String? details;
  String? commandeDateCreation;
  String? commandeStatut;
  Client? client;
  List<ProduitCommande>? produitCommande;

  MyCommande(
      {required this.commandeId,
        required this.clientId,
        required this.commandeMontantTotal,
        required this.commandeNombreProduit,
        required this.details,
        required this.commandeDateCreation,
        required this.commandeStatut,
        required this.client,
        required this.produitCommande});

  MyCommande.fromJson(Map<String, dynamic> json) {
    commandeId = json['commande_id'];
    clientId = json['client_id'];
    commandeMontantTotal = json['commande_montant_total'];
    commandeNombreProduit = json['commande_nombre_produit'];
    details = json['details'];
    commandeDateCreation = json['commande_date_creation'];
    commandeStatut = json['commande_statut'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    if (json['produit_commande'] != null) {
      produitCommande = <ProduitCommande>[];
      json['produit_commande'].forEach((v) {
        produitCommande?.add(new ProduitCommande.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commande_id'] = this.commandeId;
    data['client_id'] = this.clientId;
    data['commande_montant_total'] = this.commandeMontantTotal;
    data['commande_nombre_produit'] = this.commandeNombreProduit;
    data['details'] = this.details;
    data['commande_date_creation'] = this.commandeDateCreation;
    data['commande_statut'] = this.commandeStatut;
    final client = this.client;
    if (client != null) {
      data['client'] = client.toJson();
    }
    final produitCommande = this.produitCommande;
    if (produitCommande != null) {
      data['produit_commande'] =
          produitCommande.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class ProduitCommande {
  int? produitCommandeId;
  String? commandeId;
  String? produitId;
  String? quantite;
  String? prixUnitaire;
  String? total;
  String? categorieId;
  String? produitNom;
  String? produitPhotoPrincipale;
  String? produitPrix;
  String? produitQuantiteTotal;
  String? produitQuantiteAchete;
  String? produitQuantiteRestante;
  String? produitDateCreation;
  String? produitDateModification;
  Null? produitDateSuppression;
  String? produitStatut;

  ProduitCommande(
      {required this.produitCommandeId,
        required this.commandeId,
        required this.produitId,
        required this.quantite,
        required this.prixUnitaire,
        required this.total,
        required this.categorieId,
        required this.produitNom,
        required this.produitPhotoPrincipale,
        required this.produitPrix,
        required this.produitQuantiteTotal,
        required this.produitQuantiteAchete,
        required this.produitQuantiteRestante,
        required this.produitDateCreation,
        required this.produitDateModification,
        required this.produitDateSuppression,
        required this.produitStatut});

  ProduitCommande.fromJson(Map<String, dynamic> json) {
    produitCommandeId = json['produit_commande_id'];
    commandeId = json['commande_id'];
    produitId = json['produit_id'];
    quantite = json['quantite'];
    prixUnitaire = json['prix_unitaire'];
    total = json['total'];
    categorieId = json['categorie_id'];
    produitNom = json['produit_nom'];
    produitPhotoPrincipale = json['produit_photo_principale'];
    produitPrix = json['produit_prix'];
    produitQuantiteTotal = json['produit_quantite_total'];
    produitQuantiteAchete = json['produit_quantite_achete'];
    produitQuantiteRestante = json['produit_quantite_restante'];
    produitDateCreation = json['produit_date_creation'];
    produitDateModification = json['produit_date_modification'];
    produitDateSuppression = json['produit_date_suppression'];
    produitStatut = json['produit_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['produit_commande_id'] = this.produitCommandeId;
    data['commande_id'] = this.commandeId;
    data['produit_id'] = this.produitId;
    data['quantite'] = this.quantite;
    data['prix_unitaire'] = this.prixUnitaire;
    data['total'] = this.total;
    data['categorie_id'] = this.categorieId;
    data['produit_nom'] = this.produitNom;
    data['produit_photo_principale'] = this.produitPhotoPrincipale;
    data['produit_prix'] = this.produitPrix;
    data['produit_quantite_total'] = this.produitQuantiteTotal;
    data['produit_quantite_achete'] = this.produitQuantiteAchete;
    data['produit_quantite_restante'] = this.produitQuantiteRestante;
    data['produit_date_creation'] = this.produitDateCreation;
    data['produit_date_modification'] = this.produitDateModification;
    data['produit_date_suppression'] = this.produitDateSuppression;
    data['produit_statut'] = this.produitStatut;
    return data;
  }
}

/*class MyCommande {
  int? commandeId;
  String? clientId;
  String? commandeMontantTotal;
  Null? commandeNombreProduit;
  String? details;
  String? commandeDateCreation;
  String? commandeStatut;
  List<ProduitCommande>? produitCommande;

  MyCommande(
      {this.commandeId,
        this.clientId,
        this.commandeMontantTotal,
        this.commandeNombreProduit,
        this.details,
        this.commandeDateCreation,
        this.commandeStatut,
        this.produitCommande});

  MyCommande.fromJson(Map<String, dynamic> json) {
    commandeId = json['commande_id'];
    clientId = json['client_id'];
    commandeMontantTotal = json['commande_montant_total'];
    commandeNombreProduit = json['commande_nombre_produit'];
    details = json['details'];
    commandeDateCreation = json['commande_date_creation'];
    commandeStatut = json['commande_statut'];
    if (json['produit_commande'] != null) {
      produitCommande = <ProduitCommande>[];
      json['produit_commande'].forEach((v) {
        produitCommande?.add(new ProduitCommande.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commande_id'] = this.commandeId;
    data['client_id'] = this.clientId;
    data['commande_montant_total'] = this.commandeMontantTotal;
    data['commande_nombre_produit'] = this.commandeNombreProduit;
    data['details'] = this.details;
    data['commande_date_creation'] = this.commandeDateCreation;
    data['commande_statut'] = this.commandeStatut;
    final produitCommande = this.produitCommande;
    if (produitCommande != null) {
      data['produit_commande'] =
          produitCommande.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProduitCommande {
  int? produitCommandeId;
  String? commandeId;
  String? produitId;
  String? quantite;
  String? prixUnitaire;
  String? total;
  String? categorieId;
  String? produitNom;
  String? produitPhotoPrincipale;
  String? produitPrix;
  String? produitQuantiteTotal;
  String? produitQuantiteAchete;
  String? produitQuantiteRestante;
  String? produitDateCreation;
  String? produitDateModification;
  Null? produitDateSuppression;
  String? produitStatut;

  ProduitCommande(
      {required this.produitCommandeId,
        required this.commandeId,
        required this.produitId,
        required this.quantite,
        required this.prixUnitaire,
        required this.total,
        required this.categorieId,
        required this.produitNom,
        required this.produitPhotoPrincipale,
        required this.produitPrix,
        required this.produitQuantiteTotal,
        required this.produitQuantiteAchete,
        required this.produitQuantiteRestante,
        required this.produitDateCreation,
        required this.produitDateModification,
        required this.produitDateSuppression,
        required this.produitStatut});

  ProduitCommande.fromJson(Map<String, dynamic> json) {
    produitCommandeId = json['produit_commande_id'];
    commandeId = json['commande_id'];
    produitId = json['produit_id'];
    quantite = json['quantite'];
    prixUnitaire = json['prix_unitaire'];
    total = json['total'];
    categorieId = json['categorie_id'];
    produitNom = json['produit_nom'];
    produitPhotoPrincipale = json['produit_photo_principale'];
    produitPrix = json['produit_prix'];
    produitQuantiteTotal = json['produit_quantite_total'];
    produitQuantiteAchete = json['produit_quantite_achete'];
    produitQuantiteRestante = json['produit_quantite_restante'];
    produitDateCreation = json['produit_date_creation'];
    produitDateModification = json['produit_date_modification'];
    produitDateSuppression = json['produit_date_suppression'];
    produitStatut = json['produit_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['produit_commande_id'] = this.produitCommandeId;
    data['commande_id'] = this.commandeId;
    data['produit_id'] = this.produitId;
    data['quantite'] = this.quantite;
    data['prix_unitaire'] = this.prixUnitaire;
    data['total'] = this.total;
    data['categorie_id'] = this.categorieId;
    data['produit_nom'] = this.produitNom;
    data['produit_photo_principale'] = this.produitPhotoPrincipale;
    data['produit_prix'] = this.produitPrix;
    data['produit_quantite_total'] = this.produitQuantiteTotal;
    data['produit_quantite_achete'] = this.produitQuantiteAchete;
    data['produit_quantite_restante'] = this.produitQuantiteRestante;
    data['produit_date_creation'] = this.produitDateCreation;
    data['produit_date_modification'] = this.produitDateModification;
    data['produit_date_suppression'] = this.produitDateSuppression;
    data['produit_statut'] = this.produitStatut;
    return data;
  }
}
*/
