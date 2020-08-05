
import 'dart:convert';
import 'package:dailynews/models/ArticleModel.dart';
import 'package:http/http.dart' as http;


class News{
  List<ArticleModel> news=[];
  Future<void> getNews() async {
    String url = 'http://newsapi.org/v2/top-headlines?country=in&apiKey=1631677c9efa4d07a9b1b0ad02f89582';
    var response = await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null && element["url"]!=null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news=[];

  Future<void> getNews(String category) async {
    String url = 'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=1631677c9efa4d07a9b1b0ad02f89582';
    var response = await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null && element["url"]!=null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
