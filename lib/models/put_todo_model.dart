import 'dart:convert';

class PutTodo {
  final bool isChecked;
  PutTodo({
    required this.isChecked,
  });

// obtained from network as a string therefore, needs to be converted.. but the following below line only convert it to a Map but not an object
  factory PutTodo.fromRawJson(String str) => PutTodo.fromJson(json.decode(str));

  // here we can convert the map to an object and use it
  factory PutTodo.fromJson(Map<String, dynamic> json) => PutTodo(
        isChecked: json["isChecked"],
      );

// to send it back to network
  String toRawJson() => json.encode(toJson());

// to send it back to network
  Map<String, dynamic> toJson() => {
        "isChecked": isChecked,
      };
}
