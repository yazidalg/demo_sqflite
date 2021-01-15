import 'package:demo_sqflite/screen/register_form.dart';
import 'package:flutter/material.dart';

import 'model/users_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Users users;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterForm(users),);
  }
}
