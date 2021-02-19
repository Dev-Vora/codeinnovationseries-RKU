import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_flutter/constants.dart';

class CategoryDetails extends StatefulWidget {
  final String text;

  // receive data from the FirstScreen as a parameter
  CategoryDetails({Key key, @required this.text}) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  bool loading = true;
  String data;
  @override
  Widget build(BuildContext context) {
    if (loading) {
      readData(widget.text);
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    print(data);
    return Scaffold(
      backgroundColor: backcolor,
      appBar: AppBar(
        backgroundColor: appbarc,
        title: Text("Awareness Tips"),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: containerC,
            ),
            child: Text(
              data,
              style: TextStyle(
                fontSize: (20.0),
                wordSpacing: 1
              ),
            )),
      ),
    );
  }

  readData(category) {
    String steps = "";
    //to get steps of specific document object "User"
    DocumentReference documentReference =
        Firestore.instance.collection("Users").document(category);
    documentReference.get().then((datasnapshot) {
//      print(datasnapshot.data['Steps']);
      steps = datasnapshot.data['Steps'];
      data = steps.replaceAll('_b', '\n');
      setState(() {
        loading = false;
        print("1273902710310273001283108083218130832083102");
      });
    });
  }
}
