import 'package:flutter/material.dart';
import 'package:news_app/api/api_news.dart';
import 'package:news_app/api/article_model.dart';
import 'package:news_app/screen/widget/card_news.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reports",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: ApiNews.instance.LoadReports(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData && snapshot.data != null) {
            ArticleModel news = ArticleModel.fromJson(snapshot.data!);
            return Container(
                height: MediaQuery.of(context).size.height,
                child: CardNews(
                  news: news,
                  category: "reports",
                ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
