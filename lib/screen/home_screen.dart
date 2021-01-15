import 'package:demo_sqflite/model/crud.dart';
import 'package:demo_sqflite/model/users_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: FutureBuilder<List<Users>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data.map((e) => cardo(e)).toList(),
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }

  Card cardo(Users users) {
    return Card(
      elevation: 7,
      child: ListTile(
        title: Text(users.name),
        subtitle: Text(users.phone),
      ),
    );
  }
}
