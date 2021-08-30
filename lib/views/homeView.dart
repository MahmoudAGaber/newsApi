import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/article_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:news/viewModel/article_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeView extends StatelessWidget {


  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {

    String? category;
    List<Article>? list;

    Provider.of<ViewModelArticle>(context,listen: false).fetchArticle();
    var articlesList =Provider.of<ViewModelArticle>(context,listen: false).articlesList;

    Provider.of<ViewModelArticle>(context,listen: false).fetchArticleByCategory(category.toString());
    var articlesListByCategory =Provider.of<ViewModelArticle>(context,listen: false).articlesListByCategory;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black12,
        title: Center(
          child: Container(
            height: 70,
            width: 150,
            child: Image(
              image: AssetImage('assets/images/pngwing.com.png'),
              fit: BoxFit.fill,
              color: Colors.brown[1000],
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Flexible(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: articlesList.length,
              itemBuilder:(BuildContext context , int index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20,right: 15,left: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25.0)
                    ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           GestureDetector(
                            onTap: (){
                              String url = articlesList[index].url.toString();
                              print(url);

                              WebView(
                                  initialUrl: url,
                                  onWebViewCreated: (WebViewController webViewController) {
                                    _controller.complete(webViewController);
                                  }
                              );

                            },
                             child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(articlesList[index].imgArticle.toString(),),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                ),
                              ),
                           ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                            child: Text(articlesList[index].description.toString(),
                              ),
                          )
                        ],

                      ),
                    ),
                );
              },
            ),
          )
        ],
      )
        );
  }
}
