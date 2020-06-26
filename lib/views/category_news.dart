import 'package:dailynews/healper/news.dart';
import 'package:dailynews/models/ArticleModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles=new List<ArticleModel>();
  bool isLoding=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass=CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles=newsClass.news;
    setState(() {
      isLoding=false;
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
            Text("News",style: TextStyle(color: Colors.pinkAccent),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          Opacity(
            opacity: 0.0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.save)),
          ),
        ],
      ),
      body:isLoding?Center(child: Container(child: CircularProgressIndicator())) :SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
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
              )

            ],
          ),
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
        margin: EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1D1E33),
            borderRadius:BorderRadius.circular(10),
          ),
//            color: Colors.white,
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              ClipRRect(child: Image.network(imageUrl),borderRadius: BorderRadius.circular(6),),
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
