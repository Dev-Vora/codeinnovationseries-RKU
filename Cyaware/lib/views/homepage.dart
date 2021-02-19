import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack_flutter/Screens/AboutUs.dart';
import 'package:hack_flutter/Screens/AwarenessTips.dart';
import 'package:hack_flutter/Screens/Ref.dart';
import 'package:hack_flutter/constants.dart';
import 'package:hack_flutter/helper/widgets.dart';
import 'package:hack_flutter/services/auth.dart';

import '../helper/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  bool _loading;
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backcolor,
     appBar: AppBar(
       title: Text("Threat Posts"),
       backgroundColor: appbarc,
     ),
      body: SafeArea(

        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      /// News Article
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
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
}
