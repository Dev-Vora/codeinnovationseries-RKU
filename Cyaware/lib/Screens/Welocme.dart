import 'package:flutter/material.dart';
import 'package:hack_flutter/Screens/Login.dart';
import 'package:hack_flutter/Screens/Register.dart';
import 'package:hack_flutter/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "App Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              Image.asset(
                "assets/images/welcome.png",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                width: 300.0,
                height: 100.0,
                child: RaisedButton(
                  child: Text("SignIn"),
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: 100.0,
                width: 300.0,
                child: RaisedButton(
                  color: kPrimaryLightColor,
                  child: Text("SignUp"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUp();
                        },
                      ),
                    );
                  },
                ),
              )
            ]),
      ),
    );
  }
}
