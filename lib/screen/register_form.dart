import 'package:demo_sqflite/model/crud.dart';
import 'package:demo_sqflite/model/users_model.dart';
import 'package:demo_sqflite/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final Users users;

  RegisterForm(this.users);

  @override
  _RegisterFormState createState() => _RegisterFormState(this.users);
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(pattern)) {
      return "Enter valid email";
    }
    return null;
  }

  validatePassword(String value) {
    if (value.length < 6) {
      return "password must be more than 6 digits";
    }
    return null;
  }

  Users users;

  _RegisterFormState(this.users);

  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 3 / 4;

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CRUD dbHelper = CRUD();
  Future<List<Users>> future;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    setState(() {
      future = dbHelper.getUserList();
    });
  }

  Future<Users> navigateTo(BuildContext context, Users users) async {
    var result = await Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    if (users != null) {
      _name.text = users.name;
      _email.text = users.email;
      _phone.text = users.phone;
      _password.text = users.password;
    }
    return Scaffold(
      backgroundColor: Color(0xFFe8eae6),
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 8),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xFFff4646)), borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Color(0xFFff4646)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFFff4646),
                    ),
                    border: InputBorder.none
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phone,
                  decoration: InputDecoration(labelText: "Phone"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(labelText: "Password"),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Register",
        elevation: 2,
        child: Icon(Icons.check),
        onPressed: () async {
          if (_formKey.currentState.validate() && users == null) {
            users = Users(
              _name.text,
              _email.text,
              _phone.text,
              _password.text,
            );
            dbHelper.insertUser(users);
            updateListView();
          } else {
            users.name = _name.text;
            users.email = _email.text;
            users.phone = _phone.text;
            users.password = _password.text;
          }
          navigateTo(context, users);
        },
      ),
    );
  }
}
