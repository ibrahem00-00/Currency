class UserModel{
  String? photoUrl;
  String? password;
  String? email;
  String? name;
  String? id;
  UserModel({ this.email, this.name, this.password, this.photoUrl,this.id});
  factory UserModel.fromJson({ required Map<String, dynamic> json}){
    UserModel user = UserModel(
        email:json['email'] ,
        name: json['name'],
        password:json['password'],
        photoUrl: json['photoUrl'],
        id: json["id"]
    );
    return user;
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> J ={
      'email':email,
      'name':name,
      'password':password,
      'photoUrl':photoUrl,
      'id':id,
    };
    return J;
  }
}