// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int userId;
  int id;
  String title;
  bool completed;

  Welcome({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };

  @override
  String toString() {
    return 'Welcome(userId: $userId, id: $id, title: $title, completed: $completed)';
  }
}