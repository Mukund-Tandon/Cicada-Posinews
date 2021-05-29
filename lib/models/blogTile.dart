import 'package:flutter/material.dart';
class blogTile extends StatelessWidget {
  String imgUrl,desc,title;
  blogTile({this.imgUrl='',this.title='',this.desc=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0,left: 5.0,right: 5.0),
      height: 250,
      width: 200,
      color: Colors.grey[300],
      child: Column(
        children: [
          Expanded(
            child: Container(

              height: 160,
              child: Image.network(imgUrl,width: 200,height: 160,),
            ),
          ),
          Expanded(
            child: Container(
              height: 45,

              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                desc,
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
