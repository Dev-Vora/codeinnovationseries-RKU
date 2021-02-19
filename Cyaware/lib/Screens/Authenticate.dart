import 'package:flutter/material.dart';
import 'package:hack_flutter/Screens/Login.dart';
import 'package:hack_flutter/Screens/Register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(()=> showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn)
    {
      return Login(toggleView: toggleView);
    }
    else{
      return SignUp(toggleView: toggleView);
    }
  }
}
