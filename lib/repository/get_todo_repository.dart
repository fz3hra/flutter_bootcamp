import 'dart:convert';

import 'package:flutter_bootcamp/models/get_todo_model.dart';
import 'package:flutter_bootcamp/utils/api_constants/get_requests_constants.dart';
import 'package:http/http.dart' as http;

class GetTodoRepository {
  static Future<List<GetTodo>?> getTodosRepository() async {
    try {
      final response = await http.get(Uri.parse(GetRequestsConstants.getTodo));
      if (response.statusCode == 200) {
        List<GetTodo> getTodos = [];
        final res = jsonDecode(response.body);
        getTodos
            .addAll(List<GetTodo>.from((res).map((x) => GetTodo.fromJson(x))));
        return getTodos;
      } else {
        throw Exception("Unable to get todos");
      }
    } catch (exception, stack) {
      print("exception $exception");
      print("stack $stack");
      rethrow;
    }
  }
}
