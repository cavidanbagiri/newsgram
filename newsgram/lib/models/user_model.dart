


class UserModel{

  String id;
  String email;
  String username;
  List<String>? followers;//Who follow you
  List<String>? followusers;//Who you follow
  List<String>? subscribes;

  //Standart User Model;
  UserModel(this.id, this.email, this.username);

}
