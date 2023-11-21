import 'package:flutter/material.dart';
import 'package:news_app/api/article_model.dart';
import 'package:news_app/screen/detailblog.dart';
import 'package:news_app/screen/detailnews.dart';
import 'package:news_app/screen/detailreport.dart';

class CardNews extends StatelessWidget {
  const CardNews({super.key, required this.news, required this.category});
  final ArticleModel news;
  final String category;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.results?.length,
      itemBuilder: (BuildContext context, int index) {
        var article = news.results?[index];
        return InkWell(
          onTap: () {
            if (category == "news") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailNews(id: article.id.toString())));
            } else if (category == "blog") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailBlog(id: article.id.toString())));
            } else if (category == "reports") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailReport(id: article.id.toString())));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article!.newsSite.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      article.publishedAt.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      article.imageUrl.toString(),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  article.title.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  article.summary.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  softWrap: true,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
