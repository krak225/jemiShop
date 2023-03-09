class LoginResponse {

  String? refresh, access, id, firstname, lastname, email, telephone, adresse, genre, photo, cni, dpc, cv, att, domaine, experience, otp;


  LoginResponse({this.refresh, this.access, this.id, this.firstname, this.lastname, this.email, this.telephone, this.adresse, this.genre, this.photo, this.cni, this.dpc, this.cv, this.att, this.domaine, this.experience, this.otp});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access_token'];
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    genre = json['genre'];
    photo = json['photo'];
    cni = json['cni'];
    dpc = json['dpc'];
    cv = json['cv'];
    att = json['att'];
    domaine = json['domaine'];
    experience = json['experience'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access_token'] = this.access;
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['adresse'] = this.adresse;
    data['genre'] = this.genre;
    data['photo'] = this.photo;
    data['cni'] = this.cni;
    data['dpc'] = this.dpc;
    data['cv'] = this.cv;
    data['att'] = this.att;
    data['domaine'] = this.domaine;
    data['experience'] = this.experience;
    data['otp'] = this.otp;
    return data;
  }

  @override
  String toString() {
    return 'LoginResponse{refresh: $refresh, access: $access, id: $id, firstname: $firstname, lastname: $lastname, email: $email, telephone: $telephone, adresse: $adresse, genre: $genre, photo: $photo, domaine: $domaine, experience: $experience}';
  }

}