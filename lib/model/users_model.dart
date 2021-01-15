class Users {
  int _id;
  String _name;
  String _email;
  String _bio;
  String _phone;
  String _password;

  Users(this._name, this._email, this._phone, this._password,);

  Users.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._email = map['email'];
    this._phone = map['phone'];
    this._password = map['password'];
    this._bio = map['bio'];
  }

  int get id => _id;

  String get name => _name;

  String get email => _email;

  String get phone => _phone;

  String get password => _password;

  String get bio => _bio;

  set name(String value) {
    _name = value;
  }

  set email(String value) {
    _email = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set password(String value) {
    _password = value;
  }

  set bio(String value) {
    _bio = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = this.name;
    map['email'] = this.email;
    map['phone'] = this.phone;
    map['password'] = this.password;
    map['bio'] = this._bio;
    return map;

  }
}
