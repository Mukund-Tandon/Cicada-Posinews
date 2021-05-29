import 'dart:convert';
import 'package:http/http.dart' as http;
class newsData{
  var url= 'https://newsapi.org/v2/top-headlines?country=in&apiKey=04cf6ca3ed8649028bbcf2daeb0deb58';
   Future getData()async{
    http.Response response= await http.get(Uri.parse(url));
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      return jsonData;

    }

  }
}