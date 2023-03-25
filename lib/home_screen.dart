import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/add_todo_screen.dart';
import 'package:flutter_bootcamp/services/get_todo_services.dart';
import 'package:flutter_bootcamp/utils/color_constants.dart';
import 'package:flutter_bootcamp/utils/extension_utils.dart';
import 'package:flutter_bootcamp/widgets/text_widget.dart';
import 'package:flutter_bootcamp/widgets/todo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: Text(
          'Simple Tasks List',
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFD6F1E2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 16,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Daily Tasks",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTodoScreen(),
                          ),
                        ),
                        child: Icon(
                          Icons.add_circle_outline_rounded,
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: GetTodoServices.todoLists.length,
                      itemBuilder: (context, index) {
                        var item = GetTodoServices.todoLists[index];
                        return TodoWidget(
                          todoTitle: item.todoTitle,
                          isChecked: item.isChecked,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ).addPadding(),
    );
  }
}
