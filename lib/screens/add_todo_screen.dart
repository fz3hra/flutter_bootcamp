import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/utils/color_constants.dart';
import 'package:flutter_bootcamp/utils/extension_utils.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: Text(
          'Add Tasks List',
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/addTask.png"),
          ],
        ),
      ).addPadding(),
    );
  }
}
