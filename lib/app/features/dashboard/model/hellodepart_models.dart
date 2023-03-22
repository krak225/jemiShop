class Depart {
  int? departId;
  int? timbreId;
  int? ligneId;
  int? vehiculeId;
  int? gareId;
  int? compagnieId;
  String? departDateArrivee;
  String? departHeureArrivee;
  String? departDatePrevue;
  String? departHeurePrevue;
  String? departNbreTicketAchete;
  int? departCapacitevehicule;
  int? departTarif;
  int? departFrais;
  int? departCommission;
  int? departTimbreEtat;
  String? departDateDelaisValidite;
  String? departDateCreation;
  String? departStatut;
  Ligne? ligne;
  Compagnie? compagnie;
  Gare? gare;
  Vehicule? vehicule;
  Timbre? timbre;

  Depart(
      {required this.departId,
        required this.timbreId,
        required this.ligneId,
        required this.vehiculeId,
        required this.gareId,
        required this.compagnieId,
        required this.departDateArrivee,
        required this.departHeureArrivee,
        required this.departDatePrevue,
        required this.departHeurePrevue,
        required this.departNbreTicketAchete,
        required this.departCapacitevehicule,
        required this.departTarif,
        required this.departFrais,
        required this.departCommission,
        required this.departTimbreEtat,
        required this.departDateDelaisValidite,
        required this.departDateCreation,
        required this.departStatut,
        required this.ligne,
        required this.compagnie,
        required this.gare,
        required this.vehicule,
        required this.timbre});

  Depart.fromJson(Map<String, dynamic> json) {
    departId = json['depart_id'];
    timbreId = json['timbre_id'];
    ligneId = json['ligne_id'];
    vehiculeId = json['vehicule_id'];
    gareId = json['gare_id'];
    compagnieId = json['compagnie_id'];
    departDateArrivee = json['depart_date_arrivee'];
    departHeureArrivee = json['depart_heure_arrivee'];
    departDatePrevue = json['depart_date_prevue'];
    departHeurePrevue = json['depart_heure_prevue'];
    departNbreTicketAchete = json['depart_nbre_ticket_achete'];
    departCapacitevehicule = json['depart_capacitevehicule'];
    departTarif = json['depart_tarif'];
    departFrais = json['depart_frais'];
    departCommission = json['depart_commission'];
    departTimbreEtat = json['depart_timbre_etat'];
    departDateDelaisValidite = json['depart_date_delais_validite'];
    departDateCreation = json['depart_date_creation'];
    departStatut = json['depart_statut'];
    ligne = json['ligne'] != null ? new Ligne.fromJson(json['ligne']) : null;
    compagnie = json['compagnie'] != null
        ? new Compagnie.fromJson(json['compagnie'])
        : null;
    gare = json['gare'] != null ? new Gare.fromJson(json['gare']) : null;
    vehicule = json['vehicule'] != null
        ? new Vehicule.fromJson(json['vehicule'])
        : null;
    timbre =
    json['timbre'] != null ? new Timbre.fromJson(json['timbre']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depart_id'] = this.departId;
    data['timbre_id'] = this.timbreId;
    data['ligne_id'] = this.ligneId;
    data['vehicule_id'] = this.vehiculeId;
    data['gare_id'] = this.gareId;
    data['compagnie_id'] = this.compagnieId;
    data['depart_date_arrivee'] = this.departDateArrivee;
    data['depart_heure_arrivee'] = this.departHeureArrivee;
    data['depart_date_prevue'] = this.departDatePrevue;
    data['depart_heure_prevue'] = this.departHeurePrevue;
    data['depart_nbre_ticket_achete'] = this.departNbreTicketAchete;
    data['depart_capacitevehicule'] = this.departCapacitevehicule;
    data['depart_tarif'] = this.departTarif;
    data['depart_frais'] = this.departFrais;
    data['depart_commission'] = this.departCommission;
    data['depart_timbre_etat'] = this.departTimbreEtat;
    data['depart_date_delais_validite'] = this.departDateDelaisValidite;
    data['depart_date_creation'] = this.departDateCreation;
    data['depart_statut'] = this.departStatut;
    final ligne = this.ligne;
    if (ligne != null) {
      data['ligne'] = ligne.toJson();
    }
    final compagnie = this.compagnie;
    if (compagnie != null) {
      data['compagnie'] = compagnie.toJson();
    }
    final gare = this.gare;
    if (gare != null) {
      data['gare'] = gare.toJson();
    }
    final vehicule = this.vehicule;
    if (vehicule != null) {
      data['vehicule'] = vehicule.toJson();
    }
    final timbre = this.timbre;
    if (timbre != null) {
      data['timbre'] = timbre.toJson();
    }
    return data;
  }
}

class Ligne {
  int? ligneId;
  int? villeId01;
  int? villeId02;
  int? compagnieId;
  String? ligneDesignation;
  String? ligneKilometrage;
  String? ligneStatut;
  String? ligneDateCreation;

  Ligne(
      {required this.ligneId,
        required this.villeId01,
        required this.villeId02,
        required this.compagnieId,
        required this.ligneDesignation,
        required this.ligneKilometrage,
        required this.ligneStatut,
        required this.ligneDateCreation});

  Ligne.fromJson(Map<String, dynamic> json) {
    ligneId = json['ligne_id'];
    villeId01 = json['ville_id01'];
    villeId02 = json['ville_id02'];
    compagnieId = json['compagnie_id'];
    ligneDesignation = json['ligne_designation'];
    ligneKilometrage = json['ligne_kilometrage'];
    ligneStatut = json['ligne_statut'];
    ligneDateCreation = json['ligne_date_creation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ligne_id'] = this.ligneId;
    data['ville_id01'] = this.villeId01;
    data['ville_id02'] = this.villeId02;
    data['compagnie_id'] = this.compagnieId;
    data['ligne_designation'] = this.ligneDesignation;
    data['ligne_kilometrage'] = this.ligneKilometrage;
    data['ligne_statut'] = this.ligneStatut;
    data['ligne_date_creation'] = this.ligneDateCreation;
    return data;
  }
}

class Compagnie {
  int? compagnieId;
  String? compagnieDesignation;
  String? compagnieRepresentant;
  String? compagnieAdresseSiege;
  String? compagniePhoneBureau;
  String? compagnieMobile;
  String? compagnieFax;
  String? compagnieBp;
  String? compagnieEmail;
  String? compagnieLogo;
  String? compagnieDateCreation;
  String? compagnieStatut;

  Compagnie(
      {required this.compagnieId,
        required this.compagnieDesignation,
        required this.compagnieRepresentant,
        required this.compagnieAdresseSiege,
        required this.compagniePhoneBureau,
        required this.compagnieMobile,
        required this.compagnieFax,
        required this.compagnieBp,
        required this.compagnieEmail,
        required this.compagnieLogo,
        required this.compagnieDateCreation,
        required this.compagnieStatut});

  Compagnie.fromJson(Map<String, dynamic> json) {
    compagnieId = json['compagnie_id'];
    compagnieDesignation = json['compagnie_designation'];
    compagnieRepresentant = json['compagnie_representant'];
    compagnieAdresseSiege = json['compagnie_adresse_siege'];
    compagniePhoneBureau = json['compagnie_phone_bureau'];
    compagnieMobile = json['compagnie_mobile'];
    compagnieFax = json['compagnie_fax'];
    compagnieBp = json['compagnie_bp'];
    compagnieEmail = json['compagnie_email'];
    compagnieLogo = json['compagnie_logo'];
    compagnieDateCreation = json['compagnie_date_creation'];
    compagnieStatut = json['compagnie_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compagnie_id'] = this.compagnieId;
    data['compagnie_designation'] = this.compagnieDesignation;
    data['compagnie_representant'] = this.compagnieRepresentant;
    data['compagnie_adresse_siege'] = this.compagnieAdresseSiege;
    data['compagnie_phone_bureau'] = this.compagniePhoneBureau;
    data['compagnie_mobile'] = this.compagnieMobile;
    data['compagnie_fax'] = this.compagnieFax;
    data['compagnie_bp'] = this.compagnieBp;
    data['compagnie_email'] = this.compagnieEmail;
    data['compagnie_logo'] = this.compagnieLogo;
    data['compagnie_date_creation'] = this.compagnieDateCreation;
    data['compagnie_statut'] = this.compagnieStatut;
    return data;
  }
}

class Gare {
  int? gareId;
  int? compagnieId;
  String? gareDesignation;
  String? gareNomResponsable;
  String? garePhoneBureau;
  String? gareNumeroMobile;
  String? gareNumeroFax;
  String? email;
  String? gareAdresseGeographique;
  String? gareDateCreation;
  String? gareDateModification;
  String? gareDateSuppression;
  String? gareStatut;

  Gare(
      {required this.gareId,
        required this.compagnieId,
        required this.gareDesignation,
        required this.gareNomResponsable,
        required this.garePhoneBureau,
        required this.gareNumeroMobile,
        required this.gareNumeroFax,
        required this.email,
        required this.gareAdresseGeographique,
        required this.gareDateCreation,
        required this.gareDateModification,
        required this.gareDateSuppression,
        required this.gareStatut});

  Gare.fromJson(Map<String, dynamic> json) {
    gareId = json['gare_id'];
    compagnieId = json['compagnie_id'];
    gareDesignation = json['gare_designation'];
    gareNomResponsable = json['gare_nom_responsable'];
    garePhoneBureau = json['gare_phone_bureau'];
    gareNumeroMobile = json['gare_numero_mobile'];
    gareNumeroFax = json['gare_numero_fax'];
    email = json['email'];
    gareAdresseGeographique = json['gare_adresse_geographique'];
    gareDateCreation = json['gare_date_creation'];
    gareDateModification = json['gare_date_modification'];
    gareDateSuppression = json['gare_date_suppression'];
    gareStatut = json['gare_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gare_id'] = this.gareId;
    data['compagnie_id'] = this.compagnieId;
    data['gare_designation'] = this.gareDesignation;
    data['gare_nom_responsable'] = this.gareNomResponsable;
    data['gare_phone_bureau'] = this.garePhoneBureau;
    data['gare_numero_mobile'] = this.gareNumeroMobile;
    data['gare_numero_fax'] = this.gareNumeroFax;
    data['email'] = this.email;
    data['gare_adresse_geographique'] = this.gareAdresseGeographique;
    data['gare_date_creation'] = this.gareDateCreation;
    data['gare_date_modification'] = this.gareDateModification;
    data['gare_date_suppression'] = this.gareDateSuppression;
    data['gare_statut'] = this.gareStatut;
    return data;
  }
}

class Vehicule {
  int? vehiculeId;
  int? compagnieId;
  String? vehiculeNumero;
  String? vehiculeImmatriculation;
  String? vehiculeMarque;
  String? vehiculeModele;
  int? vehiculeNombrePlace;
  String? vehiculeCarateristique;
  String? vehiculeImage;
  String? vehiculeDateCreation;
  String? vehiculeDateModification;
  String? vehiculeDateSuppression;
  String? vehiculeStatut;

  Vehicule(
      {required this.vehiculeId,
        required this.compagnieId,
        required this.vehiculeNumero,
        required this.vehiculeImmatriculation,
        required this.vehiculeMarque,
        required this.vehiculeModele,
        required this.vehiculeNombrePlace,
        required this.vehiculeCarateristique,
        required this.vehiculeImage,
        required this.vehiculeDateCreation,
        required this.vehiculeDateModification,
        required this.vehiculeDateSuppression,
        required this.vehiculeStatut});

  Vehicule.fromJson(Map<String, dynamic> json) {
    vehiculeId = json['vehicule_id'];
    compagnieId = json['compagnie_id'];
    vehiculeNumero = json['vehicule_numero'];
    vehiculeImmatriculation = json['vehicule_immatriculation'];
    vehiculeMarque = json['vehicule_marque'];
    vehiculeModele = json['vehicule_modele'];
    vehiculeNombrePlace = json['vehicule_nombre_place'];
    vehiculeCarateristique = json['vehicule_carateristique'];
    vehiculeImage = json['vehicule_image'];
    vehiculeDateCreation = json['vehicule_date_creation'];
    vehiculeDateModification = json['vehicule_date_modification'];
    vehiculeDateSuppression = json['vehicule_date_suppression'];
    vehiculeStatut = json['vehicule_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicule_id'] = this.vehiculeId;
    data['compagnie_id'] = this.compagnieId;
    data['vehicule_numero'] = this.vehiculeNumero;
    data['vehicule_immatriculation'] = this.vehiculeImmatriculation;
    data['vehicule_marque'] = this.vehiculeMarque;
    data['vehicule_modele'] = this.vehiculeModele;
    data['vehicule_nombre_place'] = this.vehiculeNombrePlace;
    data['vehicule_carateristique'] = this.vehiculeCarateristique;
    data['vehicule_image'] = this.vehiculeImage;
    data['vehicule_date_creation'] = this.vehiculeDateCreation;
    data['vehicule_date_modification'] = this.vehiculeDateModification;
    data['vehicule_date_suppression'] = this.vehiculeDateSuppression;
    data['vehicule_statut'] = this.vehiculeStatut;
    return data;
  }
}

class Timbre {
  int? timbreId;
  String? timbreMontantmin;
  String? timbreMontantmax;
  String? timbreValeur;
  String? timbreDatedebeffet;
  String? timbreDatefineffet;
  String? timbreStatut;

  Timbre(
      {required this.timbreId,
        required this.timbreMontantmin,
        required this.timbreMontantmax,
        required this.timbreValeur,
        required this.timbreDatedebeffet,
        required this.timbreDatefineffet,
        required this.timbreStatut});

  Timbre.fromJson(Map<String, dynamic> json) {
    timbreId = json['timbre_id'];
    timbreMontantmin = json['timbre_montantmin'];
    timbreMontantmax = json['timbre_montantmax'];
    timbreValeur = json['timbre_valeur'];
    timbreDatedebeffet = json['timbre_datedebeffet'];
    timbreDatefineffet = json['timbre_datefineffet'];
    timbreStatut = json['timbre_statut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timbre_id'] = this.timbreId;
    data['timbre_montantmin'] = this.timbreMontantmin;
    data['timbre_montantmax'] = this.timbreMontantmax;
    data['timbre_valeur'] = this.timbreValeur;
    data['timbre_datedebeffet'] = this.timbreDatedebeffet;
    data['timbre_datefineffet'] = this.timbreDatefineffet;
    data['timbre_statut'] = this.timbreStatut;
    return data;
  }
}