import 'dart:math';

class User {
  int id;
  String nombreUser;
  String eMail;

  User({required this.id, required this.nombreUser,  required this.eMail});

  Map<String, dynamic> toMap() {
    return {'id':id, 'nombreUser': nombreUser, 'eMail':eMail};
  }

}