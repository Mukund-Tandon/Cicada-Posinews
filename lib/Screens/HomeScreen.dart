import 'package:flutter/material.dart';


import 'package:cicada_posinews/Widgets/blogTile.dart';
import 'package:cicada_posinews/data/newsData.dart';
import 'package:cicada_posinews/data/positiveNewsData.dart';
class homeScreen extends StatefulWidget {


  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  List<Map> positiveNewsList= [];
  bool _loading= true;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    getNewsList();


  }
  Future getNewsList()async{
    print('getnewslist start');
    await getNews();


    print('getnewslist end');
    await getPositiveNewsList();
  }
  Future getPositiveNewsList()async{
    positiveNewsList = await getpositiveNews();
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:_loading?Container(
          
          child: CircularProgressIndicator(),
        ): SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Stack(

              children: [


                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: positiveNewsList.length,
                        shrinkWrap: true,
                        physics: PageScrollPhysics(),
                        itemBuilder: (context,index){
                      return blogTile(
                        title: (positiveNewsList[index]['title']),
                        desc: (positiveNewsList[index]['desc']),
                        imgUrl: positiveNewsList[index]['imgurl'],
                        url: positiveNewsList[index]['url'],
                      );
                    }),
                  ),
                ),
                Positioned(
                  top: 25.0,
                  left: 140,
                  child: Container(
                    child: Text(
                      'PosiNews',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
