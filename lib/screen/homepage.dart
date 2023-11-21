import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_news.dart';
import 'package:news_app/api/article_model.dart';
import 'package:news_app/screen/blogpage.dart';
import 'package:news_app/screen/widget/card_news.dart';
import 'package:news_app/screen/newspage.dart';
import 'package:news_app/screen/reportpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  "The Space Devs is a group of space enthusiast developers working on a range of services, united in a common goal to improve public knowledge and accessibility of spaceflight information. We aim to bring space app developers together into a thriving community by providing helpful data and tools, accessible to everyone for free.",
                  style: GoogleFonts.fanwoodText(),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 20),
              Text("Categories",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsPage()),
                        );
                      },
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/article.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("News",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                            SizedBox(height: 10),
                            Text(
                                "Get the latest news about spaceflight and space exploration from the most popular websites and blogs in the world.",
                                style: GoogleFonts.fanwoodText(
                                    color: Colors.white70, fontSize: 12))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BlogPage()),
                        );
                      },
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/blog.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Blogs",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                            SizedBox(height: 10),
                            Text(
                                "Blog posts from the most popular spaceflight and space exploration blogs in the world. Get the latest blogs and updates.",
                                style: GoogleFonts.fanwoodText(
                                    color: Colors.white70, fontSize: 12))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReportPage()),
                        );
                      },
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/report.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reports",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                            SizedBox(height: 10),
                            Text(
                                "Space station reports, launch reports, and more. Get the latest reports from the most popular spaceflight.",
                                style: GoogleFonts.fanwoodText(
                                    color: Colors.white70, fontSize: 12))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Latest News",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              FutureBuilder(
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
            ],
          ),
        ),
      ),
    );
  }
}
