import 'package:flutter/material.dart';
import 'package:hack_flutter/Screens/Home.dart';
import 'package:hack_flutter/models/user.dart';
import 'package:hack_flutter/screens/Authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
