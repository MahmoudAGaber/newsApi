import 'package:flutter/cupertino.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/services/article_service.dart';

class ViewModelArticle extends ChangeNotifier{

  List<Article> _articleList = [];
  List<Article> _articleListByCategory = [];
  List<String> articleListFilter=[];

  Future<void>fetchArticle() async {

      _articleList = (await NewsApi().fetchData())!;
  }

  Future<void>fetchArticleByCategory(String category) async {

    _articleListByCategory = (await NewsApi().fetchDataByCategory(category))!;

  }

  List<Article> get articlesList => _articleList;
  List<Article> get articlesListByCategory => _articleListByCategory;


}

