import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/repository/delete_todo_repository.dart';
import 'package:flutter_bootcamp/repository/update_todo_repository.dart';
import 'package:flutter_bootcamp/utils/color_constants.dart';

class TodoWidget extends StatefulWidget {
  bool isChecked;
  String todoTitle;
  int id;
  Function(dynamic) check;
  Function(dynamic) isIndex;
  TodoWidget({
    super.key,
    required this.todoTitle,
    required this.isChecked,
    required this.id,
    required this.check,
    required this.isIndex,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: ColorConstants.primaryColor,
              value: widget.isChecked,
              onChanged: (check) {
                setState(() {
                  widget.isChecked = check!;
                  UpdateRepository.updateTodos(
                    widget.isChecked,
                    widget.id.toString(),
                  );
                });
              },
            ),
            Text(widget.todoTitle),
          ],
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              DeleteRepository.deleteTodos((widget.id).toString());
            });
          },
          child: const Icon(
            Icons.delete,
          ),
        ),
      ],
    );
  }
}
