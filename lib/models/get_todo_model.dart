import 'dart:convert';

class GetTodoModel {
  bool isChecked;
  String todoTitle;
  GetTodoModel({
    required this.isChecked,
    required this.todoTitle,
  });
}

// To parse this JSON data, do
//
//     final getTodo = getTodoFromJson(jsonString);

class GetTodo {
  final int? id;
  final String? title;
  final bool isChecked;
  GetTodo({
    this.id,
    this.title,
    required this.isChecked,
  });

// obtained from network as a string therefore, needs to be converted.. but the following below line only convert it to a Map but not an object
  factory GetTodo.fromRawJson(String str) => GetTodo.fromJson(json.decode(str));

  // here we can convert the map to an object and use it
  factory GetTodo.fromJson(Map<String, dynamic> json) => GetTodo(
        id: json["id"],
        title: json["title"],
        isChecked: json["isChecked"],
      );

// to send it back to network
  String toRawJson() => json.encode(toJson());

// to send it back to network
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isChecked": isChecked,
      };
}
