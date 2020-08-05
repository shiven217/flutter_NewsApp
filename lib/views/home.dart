import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailynews/healper/data.dart';
import 'package:dailynews/healper/news.dart';
import 'package:dailynews/healper/shimmer_Effect.dart';
import 'package:dailynews/models/ArticleModel.dart';
import 'package:dailynews/models/CategoryModel.dart';
import 'package:dailynews/views/article_view.dart';
import 'package:dailynews/views/category_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories=new List<CategoryModel>();
  List<ArticleModel> articles=new List<ArticleModel>();
  bool isLoding=true;
  @override
  void initState() {
    super.initState();
    categories=getCategories();
    getNews();
  }
  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    articles=newsClass.news;
    Timer timer=Timer(Duration(seconds: 2),(){
      setState(() {
        isLoding=false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Daily"),
            SizedBox(width: 3),
            Text("News",style: TextStyle(color: Colors.pinkAccent),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:isLoding?ShimmerList() : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              ///Categories///
              Container(
                height: 70.0,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }
                ),
              ),
              ///News data///
              Container(
                padding: EdgeInsets.only(top:16),
                child: ListView.builder(
                  physics:ClampingScrollPhysics() ,
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (context,index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title:articles[index].title ,
                      desc: articles[index].description,
                      url: articles[index].url,
                    );
                  },
                ),
              ),],
          ),
        ),

      ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String imageUrl,categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>CategoryNews(
              category: categoryName.toString().toLowerCase(),
            )
        ),);
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl:imageUrl,width: 120,height: 60.0,fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Text(categoryName,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
class BlogTile extends StatelessWidget {
  final String imageUrl,title,desc,url;
  BlogTile({@required this.imageUrl,this.title,this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder:(context)=>ArticleView(blogUrl: url)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1D1E33),
            borderRadius:BorderRadius.circular(10),
          ),
//            color: Colors.white,
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              ClipRRect(child: Image.network(imageUrl)),
              SizedBox(height: 8),
              Text(title,style: TextStyle(color: Colors.white,fontSize:18),),
              SizedBox(height: 8),
              Text(desc,style: TextStyle(color: Colors.white70),),
            ],
          ),
        ),
      ),
    );
  }
}
