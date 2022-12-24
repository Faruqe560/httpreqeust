// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.url,
    required this.title,
    required this.text,
    required this.publisher,
    required this.author,
    required this.image,
    required this.date,
  });

  String id;
  String url;
  String title;
  String text;
  String publisher;
  String author;
  String image;
  DateTime date;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        text: json["text"],
        publisher: json["publisher"],
        author: json["author"],
        image: json["image"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "text": text,
        "publisher": publisher,
        "author": author,
        "image": image,
        "date": date.toIso8601String(),
      };
}
