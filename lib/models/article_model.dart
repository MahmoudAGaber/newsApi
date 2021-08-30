
class Article{
  final String? title;
  final String? description;
  final String? imgArticle;
  final String? url;

  Article({ required this.title, required this.description, required this.imgArticle, required this.url});

  factory Article.fromJson(Map<String,dynamic> jsonData){
     return Article(
        title: jsonData['title'],
        description: jsonData ['description'],
        imgArticle: jsonData ['urlToImage'],
        url: jsonData ['url']
    );


  }

}