import 'dart:convert';

import 'package:flutter_bootcamp/models/put_todo_model.dart';
import 'package:flutter_bootcamp/utils/api_constants/put_requests_constants.dart';
import 'package:http/http.dart' as http;

class UpdateRepository {
  static Future<PutTodo?> updateTodos(bool isChecked, String id) async {
    try {
      final response = await http.put(
        Uri.parse(
          PutRequestsConstants.updateTodos + id,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            "isChecked": isChecked,
          },
        ),
      );
      if (response.statusCode == 204) {
        return PutTodo.fromRawJson(response.body);
      } else {
        throw Exception("could not update todos");
      }
    } catch (e, s) {
      // rethrow;
      print("exception $e");
      print("stack $s");
    }
  }
}
