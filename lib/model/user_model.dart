class UserModel {
  String user_id;
  String first_name;
  String last_name;
  String role;
  UserModel(this.first_name,this.last_name,this.role,this.user_id);
  // factory UserModel.fromJson(Map <String,dynamic> json){
  //   return UserModel(
  //     first_name: json['firstName'] as String,
  //     last_name:json["lastName"] as String,
  //     role:json["role"] as String,
  //     user_id: json["user_id"] as String
  //   );
  // }
}