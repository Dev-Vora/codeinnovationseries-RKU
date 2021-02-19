import 'package:flutter/material.dart';
import 'package:hack_flutter/Screens/AboutUs.dart';
import 'package:hack_flutter/Screens/AwarenessTips.dart';
import 'package:hack_flutter/Screens/Login.dart';
import 'package:hack_flutter/services/auth.dart';
import 'package:hack_flutter/views/homepage.dart';

import '../constants.dart';
import 'Ref.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AwarenessTips(),
      drawer: Drawer(
        child: Container(
          color: backcolor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: appbarc,
                    image: DecorationImage(
                        image: AssetImage("images/flame-web-security.png"),
                        fit: BoxFit.cover)),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AwarenessTips()));
                },
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                title: Text(
                  'Users',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                leading: Icon(
                  Icons.description,
                  color: Colors.black,
                ),
                title: Text(
                  'News',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                leading: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ref()));
                },
                leading: Icon(
                  Icons.recent_actors,
                  color: Colors.black,
                ),
                title: Text(
                  'References',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () async {
                  await _auth.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
