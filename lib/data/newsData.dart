import 'package:cicada_posinews/models/news.dart';
import 'package:cicada_posinews/Service/newsData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _firestore = FirebaseFirestore.instance;
Future<List<news>> getNews()async{
  print('getnewsstart');
  newsData data = new newsData();
  print('1');
  var jsonData=await data.getData();
  print(jsonData);
  List<news> newsArticle=[];
  print('1');
  var newsJsonData=jsonData['articles'];
  print(newsJsonData);

  for(var element in newsJsonData){
    print('1');
    if(element['urlToImage']!=null&&element['description']!=null){
      print('1');
      news News= new news(
        title: element['title'],
        url: element['url'],
        imgUrl: element['urlToImage'],
        desc: element['description']
      );
      var query = _firestore.collection('news').doc().set({
        'title': element['title'],
        'desc':element['description'],
        'url': element['url'],
        'imgurl':element['urlToImage'],

      });
      print('1');
      newsArticle.add(News);
    }
  };
  print(newsArticle);
  return newsArticle;
}