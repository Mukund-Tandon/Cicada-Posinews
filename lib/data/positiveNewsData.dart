import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
Future<List<Map>> getpositiveNews()async{

    print('getpositive view start');
    List<Map> positiveNewsList= [];
    int c= 0;
    String title = '',desc = '',imgurl='',url='';
    print('x');
    Map<String,String> map = Map();
    print('x');

    var query = await _firestore.collection('news').where('senti.score', isGreaterThan: 0,).get().then((QuerySnapshot querySnapshot)async{
      print('x');
      for(var doc in querySnapshot.docs){
        print('x');
        if(doc['imgurl']!=null){

          title =await doc['title'];

          desc =await doc['desc'];

          imgurl =await doc['imgurl'];

          url =await doc['url'];

          map={
            'title':title,
            'desc':desc,
            'url':url,
            'imgurl':imgurl,
          };
          print('x');

          print('x');
          positiveNewsList.add(map);
          String docId= doc.id;
          var query2 = await _firestore.collection('news').doc('$docId').delete();
        }

      }

    });
    print('getpositive view end');
    print(positiveNewsList);

  return positiveNewsList;
}