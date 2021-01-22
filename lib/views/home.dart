import 'package:flutter/material.dart';
import 'package:flutter_news/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text("News",style:TextStyle(
              color: Colors.blue
            ))
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: ,
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryNews;
  CategoryTile({this.imageUrl, this.categoryNews});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(imageUrl, width: 120,height: 80,)
        ],
      )
    );
  }
}