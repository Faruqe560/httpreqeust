import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../mobels/post.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse("http://www.mocky.io/v2/5ecfddf13200006600e3d6d0");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
