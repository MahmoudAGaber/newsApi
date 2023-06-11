import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/articles_model.dart';
class NewsApi {

  final apiKey = 'd82f42eac18a4700a95ed9da67aaf8bb';

  Future<List<Article>?> fetchData() async{
    try{
      Uri url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');
     http.Response response = await http.get(url);
     if(response.statusCode == 200){
       String data = response.body;
       var jsonData = jsonDecode(data);
       Articles articles = Articles.fromJson(jsonData);
       List<Article> articleList =
       articles.articles!.map((e) => Article.fromJson(e)).toList();

       return articleList;
     }
     else{
       print('StatusCode = ${response.statusCode}');
     }
    }
    catch(ex){
      print(ex);
    }
  }

  Future<List<Article>?> fetchDataByCategory(String category) async{
    try{
      Uri url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&$category&apiKey=$apiKey');
      http.Response response = await http.get(url);
      if(response.statusCode == 200){
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articleList =
        articles.articles!.map((e) => Article.fromJson(e)).toList();

        return articleList;
      }
      else{
        print('StatusCode = ${response.statusCode}');
      }
    }
    catch(ex){
      print(ex);
    }
  }
}
