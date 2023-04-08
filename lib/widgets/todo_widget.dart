import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/utils/color_constants.dart';

class TodoWidget extends StatefulWidget {
  bool isChecked;
  String todoTitle;
  int index;
  Function(dynamic) check;
  Function(dynamic) isIndex;
  TodoWidget({
    super.key,
    required this.todoTitle,
    required this.isChecked,
    required this.index,
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
      children: [
        Checkbox(
          activeColor: ColorConstants.primaryColor,
          value: widget.isChecked,
          onChanged: (check) {
            setState(() {
              widget.isChecked = check!;
            });
            // if (widget.isChecked == true) {
            //   GetTodoServices.todoLists.removeAt(widget.index);
            //   widget.isIndex(widget.index);
            // }
          },
        ),
        Text(widget.todoTitle),
      ],
    );
  }
}
