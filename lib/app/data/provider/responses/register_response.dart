class User{
  String id, firstname, lastname, email;

  User(this.id, this.firstname, this.lastname, this.email){

  }

}

class RegisterResponse {
  String? status;
  String? message;
  User? data;

  RegisterResponse({this.status, this.message});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;

    return data;
  }
}
