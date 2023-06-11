
class Articles{

  final List<dynamic>? articles ;
  Articles({required this.articles});

  factory Articles.fromJson(Map<String,dynamic> jsonData) {
    return Articles(
    articles: jsonData ['articles']
    );
  }
}