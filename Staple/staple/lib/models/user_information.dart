class UserInformation {
  int? id;
  String? name;
  String? surname;
  String? username;
  String? email;
  String? password;

  UserInformation.EmailPassword({this.email, this.password});

  UserInformation(String name, String surname, String username, String email,
      String password) {
    this.name = name;
    this.surname = surname;
    this.username = username;
    this.email = email;
    this.password = password;
  }
  UserInformation.withId(
      {this.id,
      this.name,
      this.surname,
      this.username,
      this.email,
      this.password});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["surname"] = surname;
    map["username"] = username;
    map["email"] = email;
    map["password"] = password;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  UserInformation.fromObject(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.surname = o["surname"];
    this.username = o["username"];
    this.email = o["email"];
    this.password = o["password"];
  }
}
