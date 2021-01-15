import 'package:demo_sqflite/model/crud.dart';
import 'package:demo_sqflite/model/users_model.dart';
import 'package:demo_sqflite/screen/home_screen.dart';
import 'package:demo_sqflite/screen/register_form.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Users users;

  LoginForm(this.users);

  @override
  _LoginFormState createState() => _LoginFormState(this.users);
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CRUD dbHelper = CRUD();
  Future<List<Users>> future;

  Users users;

  _LoginFormState(this.users);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
    );
  }
}
