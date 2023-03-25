import 'package:flutter_bootcamp/models/get_todo_model.dart';

class GetTodoServices {
  static List<GetTodoModel> todoLists = [
    GetTodoModel(
      isChecked: false,
      todoTitle: 'Flutter Bootcamp',
    ),
    GetTodoModel(
      isChecked: false,
      todoTitle: 'Play the division 2',
    ),
    GetTodoModel(
      isChecked: false,
      todoTitle: 'Mentoring people',
    ),
    GetTodoModel(
      isChecked: false,
      todoTitle: 'Write technical content',
    ),
    GetTodoModel(
      isChecked: false,
      todoTitle: 'Changes',
    ),
  ];
}
