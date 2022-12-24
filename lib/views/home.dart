import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:httprequest/services/remote_service.dart';

import '../mobels/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Row(
                children: [
                  Card(child: Text(posts![index].text)),
                  Card(
                    child: Text(posts![index].publisher),
                  ),
                  Text(posts![index].date.toString())
                ],
              ),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
