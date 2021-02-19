import 'dart:convert';

import 'package:hack_flutter/models/article.dart';
import 'package:http/http.dart' as http;

//import 'package:news_app_api/secret.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/everything?q=cyber OR cybercrime&qInTitle=cybercrime,cyberattach&domains=threatpost.com,ndtv.com&apiKey=92019492885d433286dde283ffcf391f";

    //String url ="https://newsapi.org/v2/top-headlines?sources=threatpost.com&apiKey=92019492885d433286dde283ffcf391f";
    /*String url='http://newsapi.org/v2/everything?' +
       // 'q=Apple&' +
        'from=2020-06-28&' +
        'sortBy=popularity&' +
        'domains=ndtv.com&'+
        'apiKey=92019492885d433286dde283ffcf391f';*/

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
