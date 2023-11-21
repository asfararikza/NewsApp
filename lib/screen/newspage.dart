import 'package:flutter/material.dart';
import 'package:news_app/api/api_news.dart';
import 'package:news_app/api/article_model.dart';
import 'package:news_app/screen/widget/card_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: ApiNews.instance.loadArticles(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData && snapshot.data != null) {
            ArticleModel news = ArticleModel.fromJson(snapshot.data!);
            return Container(
                height: MediaQuery.of(context).size.height,
                child: CardNews(news: news, category: "news"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
