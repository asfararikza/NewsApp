import 'package:flutter/material.dart';
import 'package:news_app/api/api_news.dart';
import 'package:news_app/api/detail_model.dart';
import 'package:news_app/screen/detail_screen.dart';

class DetailBlog extends StatelessWidget {
  const DetailBlog({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Blog",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: ApiNews.instance.LoadDetailBlog(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData && snapshot.data != null) {
            DetailArticleModel news =
                DetailArticleModel.fromJson(snapshot.data!);
            return DetailInformation(news: news);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
