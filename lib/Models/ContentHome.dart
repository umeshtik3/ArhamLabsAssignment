// To parse this JSON data, do
//
//     final contenthome = contenthomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Contenthome contenthomeFromJson(String str) =>
    Contenthome.fromJson(json.decode(str));

String contenthomeToJson(Contenthome data) => json.encode(data.toJson());

class Contenthome {
  Contenthome({
    required this.status,
    required this.videos,
    required this.miniCourses,
    required this.podcasts,
    required this.message,
    required this.blogs,
  });

  String status;
  List<Blog> videos;
  List<Blog> miniCourses;
  List<Blog> podcasts;
  String message;
  List<Blog> blogs;

  factory Contenthome.fromJson(Map<String, dynamic> json) => Contenthome(
        status: json["status"],
        videos: List<Blog>.from(json["videos"].map((x) => Blog.fromJson(x))),
        miniCourses:
            List<Blog>.from(json["mini_courses"].map((x) => Blog.fromJson(x))),
        podcasts:
            List<Blog>.from(json["podcasts"].map((x) => Blog.fromJson(x))),
        message: json["message"],
        blogs: List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
        "mini_courses": List<dynamic>.from(miniCourses.map((x) => x.toJson())),
        "podcasts": List<dynamic>.from(podcasts.map((x) => x.toJson())),
        "message": message,
        "blogs": List<dynamic>.from(blogs.map((x) => x.toJson())),
      };
}

class Blog {
  Blog({
    required this.id,
    required this.title,
    required this.category,
    required this.published,
    required this.publishDate,
    required this.publishTime,
    required this.author,
    required this.thumbnailUrl,
  });

  int id;
  String title;
  String category;
  bool published;
  String publishDate;
  String publishTime;
  String author;
  String thumbnailUrl;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        published: json["published"],
        publishDate: json["publish_date"],
        publishTime: json["publish_time"],
        author: json["author"],
        thumbnailUrl: json["thumbnail_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "published": published,
        "publish_date": publishDate,
        "publish_time": publishTime,
        "author": author,
        "thumbnail_url": thumbnailUrl,
      };
}
