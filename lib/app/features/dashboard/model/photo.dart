class Photo {
  int? photoId;
  String? produitId;
  String? photoSrc;
  String? photoDateCreation;

  Photo({this.photoId, this.produitId, this.photoSrc, this.photoDateCreation});

  Photo.fromJson(Map<String, dynamic> json) {
    photoId = json['photo_id'];
    produitId = json['produit_id'];
    photoSrc = json['photo_src'];
    photoDateCreation = json['photo_date_creation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo_id'] = this.photoId;
    data['produit_id'] = this.produitId;
    data['photo_src'] = this.photoSrc;
    data['photo_date_creation'] = this.photoDateCreation;
    return data;
  }
}