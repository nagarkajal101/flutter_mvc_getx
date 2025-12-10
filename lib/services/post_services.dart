
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task3/model/post_model.dart';

class PostServices {
  static const String _baseurl = "https://jsonplaceholder.typicode.com/posts";

  Future <List<PostModel>> fetchPosts() async{
    final url =Uri.parse(_baseurl);

    final response = await http.get(url);

    if(response.statusCode == 200){
      ///Success- show data
      final List<dynamic> postData = jsonDecode((response.body));
      final List<PostModel> posts = postData.map((value)=> PostModel.fromJson(value)).toList();
      return posts;
    }

    else{
      ///Failed - show Error
      throw Exception('Failed to load data: ${response.statusCode}');
    } 


  }
}