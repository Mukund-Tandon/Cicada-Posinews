import 'package:flutter/material.dart';
import 'package:cicada_posinews/Screens/ArticleView.dart';
class blogTile extends StatelessWidget {
  String imgUrl,desc,title,url;
  blogTile({this.imgUrl='',this.title='',this.desc='',this.url=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 812,
      color: Colors.green,

      child: Stack(
        children: [
          Container(
            height: 812,
            child: Image.asset('assets/images/photo-1503891617560-5b8c2e28cbf6.jpeg',fit: BoxFit.fill,),
    ),
          Positioned(
            top: 80,
            left: 24,
            child: Container(
              width: 370,
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 350,

                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(imgUrl,height: 200,fit: BoxFit.fill,))),
                  Container(
                    width: 360,
                    margin: EdgeInsets.only(left: 15,top: 20),

                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.only(top: 20,right: 189,),
                    child: Text(
                      'Short Description-',
                      style:TextStyle(
                        fontSize: 17,
                        color: Colors.white.withOpacity(.85),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      desc,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(.6),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 730,
            left: 145,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>articleView(url: url,)));
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff111a1b),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  'Read more',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
