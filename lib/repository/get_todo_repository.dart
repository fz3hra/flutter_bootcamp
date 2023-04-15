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
        // deserialize incoming network call
        var list = json.decode(response.body) as List<dynamic>;
        // add deserialized map to a list, where fromJson method is turning the map obtained to a single object
        getTodos.addAll(list.map((e) => GetTodo.fromJson(e)).toList());
        // returning list of objects iterated on
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
