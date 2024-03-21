
import 'dart:convert';

List<TodosData> todosFromJson(String str) => List<TodosData>.from(json.decode(str).map((x) => TodosData.fromJson(x)));

String todosToJson(List<TodosData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosData {
    final int userId;
    final int id;
    final String title;
    bool? completed;

    TodosData({
        required this.userId,
        required this.id,
        required this.title,
        this.completed,
    });

    factory TodosData.fromJson(Map<String, dynamic> json) => TodosData(
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
}
