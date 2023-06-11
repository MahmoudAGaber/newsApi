import 'package:flutter/cupertino.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/services/article_service.dart';

class ViewModelArticle extends ChangeNotifier{

  List<Article>? articleList = [];
  List<Article>? articleListByCategory = [];

  Future<void>fetchArticle() async {

      articleList = await NewsApi().fetchData();
      notifyListeners();
  }

  Future<void>fetchArticleByCategory() async {

    articleListByCategory = await NewsApi().fetchDataByCategory("category=business");
    notifyListeners();
  }



}

