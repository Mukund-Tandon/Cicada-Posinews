import 'package:flutter/material.dart';

import 'package:cicada_posinews/models/news.dart';
import 'package:cicada_posinews/models/blogTile.dart';
import 'package:cicada_posinews/data/newsData.dart';
class homeScreen extends StatefulWidget {


  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  List<news> newsList= [];
  bool _loading= true;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    getNewsList();

  }
  Future getNewsList()async{
    print('getnewslist start');
    newsList =await getNews();
    setState(() {
      _loading = false;
    });

    print('getnewslist end');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:_loading?Container(
          child: CircularProgressIndicator(),
        ): Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'PosiNews',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: newsList.length,
                      itemBuilder: (context,index){
                    return blogTile(
                      title: newsList[index].title,
                      desc: newsList[index].desc,
                      imgUrl: newsList[index].imgUrl,
                    );
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
