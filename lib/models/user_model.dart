class UserModel {
  int id;
  String username;
  String _password;

  UserModel(this.id, this.username, this._password);

  bool isSamePassword(String pass) {
    return _password == pass;
  }
}
