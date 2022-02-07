import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;


class News {
  List<ArticleModel> news=[];

  Future<void> getNews() async{

    String url = "https://newsapi.org/v2/everything?q=tesla&from=2021-12-19&sortBy=publishedAt&apiKey=API_KEY";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((){
        var element;
        if(element["urltoImage"] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
           title: element['title'],
           auther: element["auther"],
            description: element["description"],
             url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
          );
          news.add(articleModel);
        }
      });

    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news=[];

  Future<void> getNews(String category) async{

    String url = "https://newsapi.org/v2/everything?q=tesla&from=2021-12-19&sortBy=publishedAt&apiKey=API_KEY";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((){
        var element;
        if(element["urltoImage"] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            auther: element["auther"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
          );
          news.add(articleModel);
        }
      });

    }
  }
}