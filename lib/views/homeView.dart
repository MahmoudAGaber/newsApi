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
  import 'package:carousel_slider/carousel_slider.dart';

  class HomeView extends StatefulWidget {
    @override
    State<HomeView> createState() => _HomeViewState();
  }

  class _HomeViewState extends State<HomeView> {
    Completer<WebViewController> _controller = Completer<WebViewController>();

    @override
    void initState() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp){
        final viewModelArticle = Provider.of<ViewModelArticle>(context, listen: false);
         viewModelArticle.fetchArticle();
         viewModelArticle.fetchArticleByCategory();
      });
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black12,
          centerTitle: true,
          title: Container(
            height: 70,
            width: 150,
            child: Image(
              image: AssetImage('assets/images/pngwing.com.png'),
              fit: BoxFit.fill,
              color: Colors.blue,
            ),
          ),
        ),
        body: Consumer<ViewModelArticle>(
          builder: (context, provider, child){
               return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 12,),
                CarouselSlider.builder(
                  itemCount: provider.articleListByCategory?.length ?? 0,
                  itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                      provider.articleListByCategory!.isNotEmpty
                          ?Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Container(
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  String? url = provider.articleListByCategory![index].url.toString();
                                  print(url);
                                  WebView(
                                      initialUrl: url,
                                      onWebViewCreated: (WebViewController webViewController) {
                                        _controller.complete(webViewController);
                                      }
                                  );

                                },
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                        image: NetworkImage(provider.articleListByCategory![index].imgArticle.toString(),),opacity: 0.8,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                right: 8,
                                child: Container(
                                  height: 20,
                                  width: MediaQuery.of(context).size.width *0.8,
                                  child: Text(provider.articleListByCategory![index].description.toString(),
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              )
                            ],

                          ),
                        ),
                      )
                          :Center(child: CircularProgressIndicator()),
                  options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: false,
                  viewportFraction: 0.8,
                  aspectRatio: 2.0,
                  initialPage: 1,
                ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 8,top: 8),
                  child: Text("World News",style: TextStyle(fontSize: 16,color: Colors.black),),
                ),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.articleList?.length ?? 0,
                  itemBuilder:(BuildContext context , int index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20,right: 12,left: 12),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20))),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  String? url = provider.articleList![index].url.toString();
                                  print(url);

                                  WebView(
                                      initialUrl: url,
                                      onWebViewCreated: (WebViewController webViewController) {
                                        _controller.complete(webViewController);
                                      }
                                  );

                                },
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(provider.articleList![index].imgArticle.toString(),),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20))
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                                child: Text(provider.articleList![index].description.toString(),
                                ),
                              )
                            ],

                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          },
        )
          );
    }
  }
