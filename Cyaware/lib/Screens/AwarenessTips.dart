import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_flutter/Screens/AboutUs.dart';
import 'package:hack_flutter/Screens/CategoryDetails.dart';
import 'package:hack_flutter/Screens/Ref.dart';
import 'package:hack_flutter/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_flutter/helper/news.dart';
import 'package:hack_flutter/models/article.dart';
import 'package:hack_flutter/services/auth.dart';
import 'package:hack_flutter/views/homepage.dart';

class AwarenessTips extends StatefulWidget {
  @override
  _AwarenessTipsState createState() => _AwarenessTipsState();
}

class _AwarenessTipsState extends State<AwarenessTips> {
  final AuthService _auth = AuthService();

  var categoryList = List<String>();
  bool loading = true;
  int imgid = 0;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      getDocs();
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
    return Scaffold(
      backgroundColor: backcolor,
      appBar: AppBar(
        backgroundColor: appbarc,
        title: Text("Awareness Tips"),
      ),
      body: GridView.count(

        crossAxisCount: 2,
        children: List.generate(categoryList.length, (index) {
          return Center(
            child: Card(
              color: Color(0xFFcfd8dc),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3.0,
              child: InkWell(
                splashColor: Colors.grey.withAlpha(30),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetails(
                          text: categoryList[index],
                        ),
                      ));
                },
                child: Container(
                  height: 150.0,
                  width: 180.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: SvgPicture.asset("assets/images/$index.svg"),

                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                          categoryList[index]),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
      drawer: Drawer(
        child: Container(
          color: backcolor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>  [

              DrawerHeader(
                decoration: BoxDecoration(
                    color: appbarc,
                    image: DecorationImage(
                        image: AssetImage("images/flame-web-security.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),

              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AwarenessTips()));                },
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                title: Text('Users',

                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                leading: Icon(
                  Icons.description,
                  color: Colors.black,
                ),
                title: Text(
                  'News',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              ListTile(
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                leading: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Ref()));
                },
                leading: Icon(
                  Icons.recent_actors,
                  color: Colors.black,
                ),
                title: Text(
                  'References',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ),
              ListTile(
                onTap: () async{
                  await _auth.signOut();

                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ),

            ],
          ),
        ),

      ),
    );
  }

  getDocs() async {
    //to get All documents "User names" from db
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("Users").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      categoryList.add(a.documentID);
//      print(a.documentID);
    }
    /*if(imgid < 9){

    }*/
    setState(() {
      loading = false;
    });
  }
}
