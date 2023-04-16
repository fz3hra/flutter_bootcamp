import 'dart:convert';

import 'package:flutter_bootcamp/models/get_todo_model.dart';
import 'package:flutter_bootcamp/utils/api_constants/delete_requests_constants.dart';
import 'package:http/http.dart' as http;

class DeleteRepository {
  static Future<GetTodo?> deleteTodos(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(
          DeleteRequestsConstants.deleteTodo + id,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return GetTodo.fromRawJson(response.body);
      } else {
        throw Exception("could not delete todos");
      }
    } catch (e, s) {
      // rethrow;
      print("exception $e");
      print("stack $s");
    }
  }
}
