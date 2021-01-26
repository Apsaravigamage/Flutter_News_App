import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/category_model.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text("News",style:TextStyle(
              color: Colors.white
            ))
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator() ,),
      ):
      SingleChildScrollView(
        child: Container(
          child: Column(
            children:<Widget>[
              //categories
              Container(
                padding: EdgeInsets.symmetric(horizontal:16, vertical: 16,),
                height: 120,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName
                    );
                  }
                ),
              ),
              //Blogs
              Container(
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                     return BlogTile(
                       imageUrl: articles[index].urlToImage,
                       title: articles[index].title,
                       desc: articles[index].description,
                     );
                  }),
              )
            ]
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:10),
      child: Stack(
        children: <Widget>[
         ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(imageUrl, width: 120,height: 100, fit: BoxFit.cover,)),
          Container(
            alignment: Alignment.center,
            width: 120,height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            child: Text(
              categoryName, 
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      )
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title,desc;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ]
      ),
    );
  }
}