class Comment{
  final int id;
  final int offrenombreposte;
  final String offretitre;
  final String offredescription;
  final String offre_datepublic;
  final String offre_datefin;
  final String entreprise;
  final String offre_image;
  final String type_contrat;
  final String diplome;
  final int experience;
  final String metier;
  final int offre_partage;
  final int offre_like;
  final int postulable;

  Comment({
    required this.id,
    required this.offrenombreposte,
    required this.offretitre,
    required this.offredescription,
    required this.offre_datepublic,
    required this.offre_datefin,
    required this.entreprise,
    required this.offre_image,
    required this.type_contrat,
    required this.diplome,
    required this.experience,
    required this.metier,
    required this.offre_partage,
    required this.offre_like,
    required this.postulable,
  });

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
    id: json["offre_id"],
    offrenombreposte: int.parse(json["offrenombreposte"]),
    offretitre: json["offretitre"],
    offredescription: json["offredescription"],
    offre_datepublic: json["offre_datepublic"].toString(),
    offre_datefin: json["offre_datefin"].toString(),
    entreprise: json["raisonsociale"].toString(),
    offre_image: json["offre_image"].toString(),
    type_contrat: json["typetravailib"].toString(),
    diplome: json["diplomelib"].toString(),
    experience: int.parse(json["experience"]),
    metier: json["metier_libelle"].toString(),
    offre_partage: json["offre_partage"],
    offre_like: json["offre_like"],
    postulable: json["postulable"],
  );


}