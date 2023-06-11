import 'package:flutter/material.dart';
import 'package:news/viewModel/article_view_model.dart';
import 'package:news/views/LoginScreen.dart';
import 'package:news/views/homeView.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(news());

}

class news extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewModelArticle()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        title: "NewsApi",
        home: LoginScreen()
      ),
    );
  }
}

