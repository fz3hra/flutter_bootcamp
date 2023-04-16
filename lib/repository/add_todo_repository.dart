import 'dart:convert';

import 'package:flutter_bootcamp/models/get_todo_model.dart';
import 'package:flutter_bootcamp/utils/api_constants/post_requests_constants.dart';
import 'package:http/http.dart' as http;

class AddTodoRepository {
  static Future<GetTodo> createTodos(String title, bool isChecked) async {
    try {
      final response = await http.post(
        Uri.parse(PostRequestsConstants.createTodo),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            "title": title,
            "isChecked": isChecked,
          },
        ),
      );
      if (response.statusCode == 201) {
        return GetTodo.fromRawJson(response.body);
      } else {
        throw Exception("could not add todos");
      }
    } catch (e, s) {
      rethrow;
    }
  }
}
