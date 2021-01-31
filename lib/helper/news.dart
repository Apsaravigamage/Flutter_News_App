
import 'dart:convert';

import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = []; 
  
  Future<void> getNews() async{
    String url ="http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=b14c3f1584d64982b8b0c7b276d295a8";

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);

  if(jsonData['status'] == "ok"){
    jsonData["articles"].forEach((element){

      if(element["urlToImage"] != null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["context"]
        );
        news.add(articleModel);
      }

    });
  }
  }
}